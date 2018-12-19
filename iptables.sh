#!/bin/sh -x

# IPTables default configuration script for new servers
# Author: Christopher Ashby
# Last Updated: 9/1/2017
# Script to install and setup IPTables and Fail2ban. After execution only ports 22/80/443 are accessible.

# Requirements:
# Redhat/CentOS 6
# IPTables

# Install fail2ban
echo "Installing fail2ban..."
sudo yum update
sudo yum install fail2ban -y
sudo chkconfig --level 23 fail2ban on

# Clone the config file (its updated with package updates), so we need a clone
sudo cp /etc/fail2ban/jail.conf /etc/fail2ban/jail.local

# Note:
# - if running nginx, then edit the file and enable the jail for it
# - we might also want to extend the bantime to something like 1800
# sudo nano /etc/fail2ban/jail.local

# Restart the service
sudo service fail2ban stop
sudo service fail2ban start

# Prevent DoS attacks and enable syn protection
echo "Setting up sysctl IPv4 settings to enable advanced protections..."
$SYSCTL net.ipv4.ip_forward=0
$SYSCTL net.ipv4.conf.all.send_redirects=0
$SYSCTL net.ipv4.conf.default.send_redirects=0
$SYSCTL net.ipv4.conf.all.accept_source_route=0
$SYSCTL net.ipv4.conf.all.accept_redirects=0
$SYSCTL net.ipv4.conf.all.secure_redirects=0
$SYSCTL net.ipv4.conf.all.log_martians=1
$SYSCTL net.ipv4.conf.default.accept_source_route=0
$SYSCTL net.ipv4.conf.default.accept_redirects=0
$SYSCTL net.ipv4.conf.default.secure_redirects=0
$SYSCTL net.ipv4.icmp_echo_ignore_broadcasts=1
#$SYSCTL net.ipv4.icmp_ignore_bogus_error_messages=1
$SYSCTL net.ipv4.tcp_syncookies=1
$SYSCTL net.ipv4.conf.all.rp_filter=1
$SYSCTL net.ipv4.conf.default.rp_filter=1
$SYSCTL kernel.exec-shield=1
$SYSCTL kernel.randomize_va_space=1

# Setup IPTables
echo "Configuring IPTables for your environment..."

# Install and enable IPTables
sudo yum install iptables -y
sudo chkconfig iptables on

# Reset the default input / output policies and flush any existing rules
sudo iptables -P INPUT ACCEPT
sudo iptables -P OUTPUT ACCEPT
sudo iptables -F

# Accept incoming packets from established or existing connections
sudo iptables -A INPUT -m conntrack --ctstate ESTABLISHED,RELATED -j ACCEPT

# Log and drop spoofing source addresses
sudo iptables -A INPUT -i eth0 -s 10.0.0.0/8 -j LOG --log-prefix "IP DROP SPOOF "
sudo iptables -A INPUT -i eth0 -s 172.16.0.0/12 -j LOG --log-prefix "IP DROP SPOOF "
sudo iptables -A INPUT -i eth0 -s 192.168.0.0/16 -j LOG --log-prefix "IP DROP SPOOF "
sudo iptables -A INPUT -i eth0 -s 224.0.0.0/4 -j LOG --log-prefix "IP DROP MULTICAST "
sudo iptables -A INPUT -i eth0 -s 240.0.0.0/5 -j LOG --log-prefix "IP DROP SPOOF "
sudo iptables -A INPUT -i eth0 -d 127.0.0.0/8 -j LOG --log-prefix "IP DROP LOOPBACK "
sudo iptables -A INPUT -i eth0 -s 169.254.0.0/16  -j LOG --log-prefix "IP DROP MULTICAST "
sudo iptables -A INPUT -i eth0 -s 0.0.0.0/8  -j LOG --log-prefix "IP DROP "
sudo iptables -A INPUT -i eth0 -s 240.0.0.0/4  -j LOG --log-prefix "IP DROP "
sudo iptables -A INPUT -i eth0 -s 255.255.255.255/32  -j LOG --log-prefix "IP DROP  "
sudo iptables -A INPUT -i eth0 -s 168.254.0.0/16  -j LOG --log-prefix "IP DROP "
sudo iptables -A INPUT -i eth0 -s 248.0.0.0/5  -j LOG --log-prefix "IP DROP "

# Enable ssh and web ports
sudo iptables -A INPUT -p tcp --dport 22 -j LOG —log-level info —log-prefix “SSH Traffic “
sudo iptables -A INPUT -p tcp --dport 22 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 80 -j LOG —log-level info —log-prefix “HTTP Traffic “
sudo iptables -A INPUT -p tcp --dport 80 -j ACCEPT
sudo iptables -A INPUT -p tcp --dport 443 -j LOG —log-level info —log-prefix “HTTPS Traffic “
sudo iptables -A INPUT -p tcp --dport 443 -j ACCEPT

# Enable loopback (localhost) access
sudo iptables -I INPUT 1 -i lo -j ACCEPT

# Set the last rule to drop all traffic
sudo iptables -A INPUT -j LOG —log-level info —log-prefix “Drop Any “
sudo iptables -A INPUT -j DROP


# Save for restarts
iptables-save > /etc/sysconfig/iptables
ip6tables-save > /etc/sysconfig/ip6tables

echo "Configuration is completed successfully, checking the output of rules"
# Check the policy
sudo iptables -nvL

echo "For assistance with IPtables or fail2ban please see the corresponding man pages!"

done
