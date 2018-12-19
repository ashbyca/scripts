#!/bin/bash
#
# include existing path statement
PATH="${PATH}:/usr/local/bin:/usr/bin:/bin:/usr/sbin:/sbin"
#
# load enviro variables including hostname/cwdr/username
export PS1="\h:\W \u$ "
#
# set logging parameters
FORMATTED_DATE=`/bin/date "+%Y-%m-%d-%H%M"`;/usr/bin/script  ~/Library/Logs/Terminal/terminal_$FORMATTED_DATE.log
