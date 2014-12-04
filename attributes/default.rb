# Name of openvpn server.
default['openvpn']['server_name'] = 'default'
# This address will be used for clients config as vpn server address.
default['openvpn']['default']['remote_host'] = 'vpn.example.com'

# Server is accepting connections on this IP.
default['openvpn']['default']['server_ip'] = '127.0.0.1'
# Network port to listen on.
default['openvpn']['default']['port'] = '1194'
# Protocol to use (tcp or udp).
default['openvpn']['default']['proto'] = 'udp'
# Type of dev to use (tun or tap).
default['openvpn']['default']['dev'] = 'tun'
# OpenVPN server mode: routed or bridged.
default['openvpn']['default']['mode'] = 'routed'
# Netmask to use (for routed and bridged modes).
default['openvpn']['default']['netmask'] = '255.255.255.0'
# Only in routed mode. This subnet is used for vpn client addresses. Server takes first address in this subnet.
default['openvpn']['default']['subnet'] = '127.0.1.0'
# Only in bridged mode. OpenVPN tap interface will be added to this bridge (see up/down scripts).
default['openvpn']['default']['network_bridge'] = 'br0'
# Only in bridged mode. Network interface used for bridging, we need to turn promisc mode for it.
default['openvpn']['default']['network_interface'] = 'eth0'
# Only in bridged mode. Assign client addresses from this range.
default['openvpn']['default']['dhcp_start'] = '127.0.1.100'
default['openvpn']['default']['dhcp_end'] = '127.0.1.150'
default['openvpn']['default']['verb'] = '3'

# Array of route strings that will be pushed on client connect.
default['openvpn']['default']['push'] = []
default['openvpn']['default']['duplicate_cn'] = false
# True\False. Allow clients talk to each other.
default['openvpn']['default']['client_to_client'] = false
default['openvpn']['default']['keepalive_interval'] = 10
default['openvpn']['default']['keepalive_timeout'] = 60
# True\False. Enable compression.
default['openvpn']['default']['comp_lzo'] = true
default['openvpn']['default']['link_mtu'] = nil
default['openvpn']['default']['tun_mtu'] = nil
default['openvpn']['default']['cipher'] = false
# True\False. Send all traffic through vpn channel
default['openvpn']['default']['redirect_gateway'] = false
default['openvpn']['default']['push_dns_server'] = false
# Set it to "2" for bridged mode to allow script execution needed to configure network interfaces
default['openvpn']['default']['script_security'] = 1

default['openvpn']['default']['users'] = []
default['openvpn']['default']['revoked_users'] = []
