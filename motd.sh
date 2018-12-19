#!/bin/bash
#
# Purpose: Creates dynamic motd for CentOS
# Author: Christopher Ashby
# Save as /etc/cron.hourly/motd.sh

main() {

**Add Hostname Flare**

echo
echo System Information
echo Hostname: $(hostname)
echo IP Address: "/sbin/ifconfig eth0 | grep 'inet addr:' | cut -d: -f2 | awk '{ print $1}'"
echo Operating System: 'cat /etc/redhat-release'
UPDATES_COUNT=$(yum check-update --quiet | grep -v "^$" | wc -l)
if [[ $UPDATES_COUNT -gt 0 ]]; then
echo "Updates Available: ${UPDATES_COUNT}"
echo Kernel Version: 'uname -r'
echo --------------------------------------------------------
echo -ne '\E[0;31m'"\033[1mUptime: \033[0m $(uptime | cut -d " " -f 5-18)"
echo -e '\E[0;31m'"\033[1mRecent Logins: \033[0m"
last | head -n 3
echo
echo -e '\E[0;31m'"\033[1mRecent SSH Failures: Total Count:\033[0m $(grep sshd /var/log/messages|  awk '/failure/' | wc -l)"
grep sshd /var/log/messages|  awk '/failure/ {print $1,$3,$9,$10,$11,$12,$13}' /var/log/messages | tail -n 3
echo --------------------------------------------------------
echo
}
main > /etc/motd
