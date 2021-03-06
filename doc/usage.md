# Usage

For example you want to setup vpn server and call it ```office```

* Ensure that you have ```.chef/encrypted_data_bag_secret```.
Otherwise you can generate one with ```openssl rand -base64 512 > .chef/encrypted_data_bag_secret```

* Install knife plugin into your project chef directory:

  ```
  mkdir -p /path/to/your/project/.chef/plugins/knife
  cp /path/to/this/openvpn/cookbook/knife_plugin.rb /path/to/your/project/.chef/plugins/knife/openvpn.rb
  ```

* Create server certificate authority, server cert/key, DH params:

  ```
  knife openvpn server create office
  ```

  ```office``` - is a name of vpn-server, there is some limitations on this: no dots, no commas, no spaces, no special symbols for reasons.

* Great, now check ```data_bags``` directory, you will find new databag ```openvpn-office``` with few items for ca, dh, cert/key pair and some openssl config. Now it is time to upload it to Chef server:

  ```
  knife data bag create openvpn-office --secret-file=.chef/encrypted_data_bag_secret
  knife data bag from file openvpn-office data_bags/openvpn-office/*
  ```

* Add ```recipe[openvpn]``` to node run_list, and override default attributes:

  ```
  "run_list": [
  "recipe[openvpn]"
  ],
  "default_attributes": {
    "openvpn": {
      "server_name": "office",
      "office": {
        "remote_host": "vpn.example.com",
        "server_ip": "10.90.5.5",
        "subnet": "10.200.1.0",
        "port": "443",
        "proto": "tcp",
        "dev": "tun",
        "verb": "3",
        "push": [
        "route 10.90.0.0 255.255.255.0",
        "route 10.90.1.0 255.255.255.0"
        ]
      }
    }
  }

  ```

  Chef, run!

* When server is up and running we can add some users to start use it.
No moar certificate management pain:

  ```
  knife openvpn user create office john
  knife data bag from file openvpn-office data_bags/openvpn-office/john.json
  ```

* Export vpn-client data and send it to John:

  ```
  knife openvpn user export office john
  ```
resulting archive contains config (.ovpn), ca cert, John's cert and key

* Revokation of user certificate is also possible:
  ```
  knife openvpn user revoke office john
  knife data bag from file openvpn-office data_bags/openvpn-office/openvpn-crl.json
  ```
