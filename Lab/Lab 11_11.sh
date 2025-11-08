#Log into your workstation as the student user.
#Start the lab environment:
lab start net-review
ssh student@
#Switch to root:
su - 
#or sudo -i
#password is redhat if not try student

------

nmcli device show
nmcli con add type ethernet con-name lab ifname eth0 \
  ipv4.method manual \
  ipv4.addresses 172.25.250.11/24 \
  ipv4.gateway 172.25.250.254 \
  ipv4.dns 172.25.250.254
#the eth0 is my interface name, you can replace it with yours, maybe also eth0, you can find it in the first or second line from the nmcli device show command
nmcli con mod lab connection.autoconnect yes
nmcli con mod "System eth0" connection.autoconnect no
nmcli con mod lab +ipv4.addresses 10.0.1.1/24
echo "10.0.1.1 private" >> /etc/hosts
reboot
ip addr
nmcli con show
ping -c 2 private

------

lab grade net-review
cd ~
lab finish net-review
Tekaai Tekanene