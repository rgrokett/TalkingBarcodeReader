
   29  sudo apt-get install hostapd isc-dhcp-server
   30  systemctl status isc-dhcp-server.service
   31  systemctl status isc-dhcp-server.service
   32  vi /etc/dhcp/dhcpd.conf

subnet 192.168.42.0 netmask 255.255.255.0 {
range 192.168.42.10 192.168.42.50;
option broadcast-address 192.168.42.255;
option routers 192.168.42.1;
default-lease-time 600;
max-lease-time 7200;
option domain-name "local";
option domain-name-servers 8.8.8.8, 8.8.4.4;
}

   33  vi /etc/default/isc-dhcp-server
INTERFACES="wlan0"

   34  ifconfig -a
   35  vi /etc/network/interfaces
auto lo br0
iface lo inet loopback

auto eth0
iface eth0 inet manual

auto wlan0
#iface wlan0 inet manual
iface wlan0 inet static
address 192.168.42.1
netmask 255.255.255.0


iface br0 inet dhcp
bridge_ports eth0 wlan0

   36  vi /etc/default/hostapd
DAEMON_CONF="/etc/hostapd.conf"

   37  cat /etc/hostapd.conf
interface=wlan0
wpa_passphrase=12345678

   38  vi /etc/init.d/hostapd




