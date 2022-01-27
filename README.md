![Background Image](https://user-images.githubusercontent.com/6200040/50236438-60718a00-0388-11e9-887d-8bbc1f794ded.JPG)

# Miscellaneous Scripts

A collection of various scripts used to automate operational tasks, validate settings, or perfrom automated stage1 analysis grouped together by function.  Each script contains a readme section where appropriate.  

**Please note - these scripts aren't maintained until needed again so your mileage may vary.  All work for their purpose when uploaded.**

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
| [gitupdate.sh](https://github.com/ashbyca/rsc-admin/blob/master/gitupdate.sh) | Script to automatically download all tool updates from github. |
| [sslfree.sh](https://github.com/ashbyca/rsc-admin/blob/master/sslfree.sh) | Script to download, convert, and install SSL cert for lab. | 
| [get-sysinfo.ps1](https://github.com/ashbyca/scripts/blob/master/get-sysinfo.ps1) | Get Complete details of any server or remote asset. |
| [osxsetup.sh](https://github.com/ashbyca/scripts/blob/master/osxsetup.sh) | OSX Setup script for new machines. |
| [splunk-custom.py](https://github.com/ashbyca/scripts/blob/master/splunk-custom.py) | Script for transforming Splunk Alerts to Incidents. |

---

### Security Analysis Scripts

| Script  |  Purpose |
|:-----------:|:--------|
| [dnslookup.bat](https://github.com/ashbyca/rsc-admin/blob/master/dnslookup.bat)     | Script to performs large dns lookups and write results to a file. |
| [blcheck.sh](https://github.com/ashbyca/rsc-admin/blob/master/blcheck.sh)     | Script to quickly identify if a public routable IP address is blacklisted. |
| [vol_analysis.sh](https://github.com/ashbyca/rsc-admin/blob/master/vol_analysis.sh)     | Script to quickly extract artifacts from memory dumps dumps using volitility. |
| [twint_import.sh](https://github.com/ashbyca/rsc-admin/blob/master/twint_import.sh)     | Script to import relevant information from twitter using twint applciation.  | 

---

### Validation Scripts

| Script  |  Purpose |
|:-----------:|:--------|
| [hello.hta](https://github.com/ashbyca/rsc-admin/blob/master/hello.hta)     | Script to validate if HTA files can execute on local hosts - Windows only. | 
| [box_malicious_test.txt](https://github.com/ashbyca/rsc-admin/blob/master/box_malicious_test.txt)     | Text document to trigger malicious detection rules on Box.  |

---

### MacOS Scripts

To install, download each zip file above, extract the contents and copy to '''~/Library/Scripts'''.  Make sure to activate the menu option in Script Editor Preferences if you haven't already.  To execute the script, click the little scroll on the menu and select the one you want.

**All scripts currently work with OSX v10.10 and below.**  

---

### Copyright and license

It is under [the MIT license](/LICENSE).
