A script for automating local ftp transfers. I wouldn’t recommend this be used across the internet or from/to networks that aren’t trusted. As you should be aware, FTP isn’t a secure protocol and all information is sent in clear-text across the wire. 

The script uses simple values to pass to the ftp daemon, downloading files requested without any user interaction.

Prior to use, modifications will need to be made and include:

1. Change the host value
2. Change the user value
3. Change the passwd value
4. Change the file value (this is the local file to upload)
5. Change the remotefile value (this is the remote file to be uploaded)

After save the file and execute the script. All output will be in the command window. If you receive errors they will be displayed as standard output.
