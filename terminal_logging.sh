#!/bin/bash
#
# Author - Christopher Ashby
# Last Update - 20190124
#
# For those that use the terminal or command window a lot, I have created a quick and dirty little script to log all terminal commands 
# allowing you to review and not have to worry about buffer history being over written.

# To use and install the script:

# Download this file
# Open your Terminal preferences and under shell options select run this command and add the script and location
# Shell script to log terminal sessions, files are located in "Library/Logs/Terminal"
# include existing path statement

PATH="${PATH}:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#
# load enviro variables including hostname/cwdr/username
export PS1="\h:\W \u$ "
#
# set logging parameters
FORMATTED_DATE=`/bin/date "+%Y-%m-%d-%H%M"`;/usr/bin/script  ~/Library/Logs/Terminal/terminal_$FORMATTED_DATE.log
