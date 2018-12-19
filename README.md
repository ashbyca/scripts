# RSC-Admin

Collection of various (IT) administration scripts used to automate specific tasks.  Each script is represented with a readme where approipriate.  

Please note that these aren't maintained anymore and your mileage may vary.

### Various Administration Scripts

| Script  |  Purpose |
|:-----------:|:--------|
| [ftptransfer.sh](https://github.com/ashbyca/rsc-admin/blob/master/ftptransfer.sh)     | Script to automate local ftp transfers between hosts. |
| [scptransfers.sh](https://github.com/ashbyca/rsc-admin/blob/master/scptransfers.sh)    | Script to automate downloads over ssh using scp.|
| [term_logging.sh](https://ashby.keybase.pub/Blog/Scripts/terminal_logging.sh)    | Script to log all terminal sessions to local file in OSX.  |
| [iptables.sh](https://ashby.keybase.pub/Blog/Scripts/iptables.sh) | Script to automate the setup of iptables in CentOS. |
| [motd.sh](https://ashby.keybase.pub/Blog/Scripts/motd.sh) | Script to automate the setup of a MOTD banner in CentOS. |
| [dnslookup.bat](https://github.com/ashbyca/rsc-admin/blob/master/dnslookup.bat)     | Script to performs large dns lookups and write results to a file. |
| [blcheck.sh](https://github.com/ashbyca/rsc-admin/blob/master/blcheck.sh)     | Script to quickly identify if a public routable IP address is blacklisted. |

### MacOS Scripts

I have been playing around with Apple Script Editor to automate some tasks on my OSX device.  Descriptions and links are below if you find these useful or want to test:

1. [Disable OSX Dashboard](https://github.com/ashbyca/rsc-admin/blob/master/Disable%20OSX%20Dashboard.zip)
2. [Remove INET Downloads](https://github.com/ashbyca/rsc-admin/blob/master/Remove%20INET%20Downloads.zip)

* To install, download each zip file above, extract the contents and copy to '''~/Library/Scripts'''.
* Make sure to activate the menu option in Script Editor Preferences if you haven't already.
* All scripts currently work with OSX v10.10 and below.  

To execute the script, click the little scroll on the menu and select the one you want.  Each script is does what it’s named for, should be self explanatory.  I found this [tutorial](https://macosxautomation.com/applescript/firsttutorial/02.html) for those who haven’t used this software before and want additional information on getting started.

### Copyright and license

It is under [the MIT license](/LICENSE).
