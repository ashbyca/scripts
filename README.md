# RSC-Admin

Collection of various (IT) administration scripts used to automate specific tasks.  Each script is represented with a readme where approipriate.  

**Please note - these scripts aren't maintained anymore and your mileage may vary.**

---

### IT Operation Scripts

| Script  |  Purpose |
|:-----------:|:--------|
| [ftptransfer.sh](https://github.com/ashbyca/rsc-admin/blob/master/ftptransfer.sh)     | Script to automate local ftp transfers between hosts. |
| [scptransfers.sh](https://github.com/ashbyca/rsc-admin/blob/master/scptransfers.sh)    | Script to automate downloads over ssh using scp.|
| [term_logging.sh](https://github.com/ashbyca/rsc-admin/blob/master/terminal_logging.sh)    | Script to log all terminal sessions to local file in OSX.  |
| [iptables.sh](https://github.com/ashbyca/rsc-admin/blob/master/iptables.sh) | Script to automate the setup of iptables in CentOS. |
| [motd.sh](https://github.com/ashbyca/rsc-admin/blob/master/motd.sh) | Script to automate the setup of a MOTD banner in CentOS. |
| [disable dashboard](https://github.com/ashbyca/rsc-admin/blob/master/Disable%20OSX%20Dashboard.zip) | Apple Script to disable OSX dashboard feature. |
| [remove downloads](https://github.com/ashbyca/rsc-admin/blob/master/Remove%20INET%20Downloads.zip) | Apple Script to remove all internet downloads and cache. |

---

### Security Analysis Scripts

| Script  |  Purpose |
|:-----------:|:--------|
| [dnslookup.bat](https://github.com/ashbyca/rsc-admin/blob/master/dnslookup.bat)     | Script to performs large dns lookups and write results to a file. |
| [blcheck.sh](https://github.com/ashbyca/rsc-admin/blob/master/blcheck.sh)     | Script to quickly identify if a public routable IP address is blacklisted. |
| [vol_analysis.sh](https://github.com/ashbyca/rsc-admin/blob/master/vol_analysis.sh)     | Script to quickly extract artifacts from memory dumps dumps using volitility. |

---

### MacOS Scripts

To install, download each zip file above, extract the contents and copy to '''~/Library/Scripts'''.  Make sure to activate the menu option in Script Editor Preferences if you haven't already.  To execute the script, click the little scroll on the menu and select the one you want.

**All scripts currently work with OSX v10.10 and below.**  

---

### Copyright and license

It is under [the MIT license](/LICENSE).
