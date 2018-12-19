#!/bin/bash

# Author - Christopher Ashby
# Last Updated - 20140220
# Version - v1.0

# Items to be completed:
# report generation for quicker analysis

# Requirements
# Volatility Framework (tested with v2.3) - https://code.google.com/p/volatility/
# Distorm3 (tested with vx.x) - http://code.google.com/p/distorm/
# Yara (tested with v2.0) - http://code.google.com/p/yara-project/
# Pycrypto (tested with vx.x) https://www.dlitz.net/software/pycrypto/
# PIL (tested with vx.x) - http://www.pythonware.com/products/pil/
# OpenPyxl (tested with vx.x) - https://bitbucket.org/ericgazoni/openpyxl/wiki/Home
# Python v2.7 - http://www.python.org/‎
# Perl v5.16 - http://www.perl.org/
# *nix based system utilities

# Define some system variables for your environment
VOLDIR="/opt/volatility/"
PYTHON="/usr/bin/python"
SORT="/usr/bin/sort"
GREP="/usr/bin/grep"
TEE="/usr/bin/tee"
PERL="/usr/bin/perl"

# User variables - Be sure to change these before use!
CASELIB="/Users/caashby/Documents/Malware/20140402"
MEMDUMP="/Users/caashby/Documents/Malware/20140402/MemoryDump_10.116.100.229-2014-03-31.mem"
MALPROCESS="/Users/caashby/Documents/Malware/20140402/Evidence/Processes"
VTRESULTS="/Users/caashby/Documents/Malware/20140402/Evidence/"

# Supported Platform Profiles - Be sure to uncomment the one needed.  Only 1 profile is supported per analysis.

# IMGPROFILE="--profile=VistaSP0x64"     # Profile for Windows Vista SP0 x64
# IMGPROFILE="--profile=VistaSP0x86"     # Profile for Windows Vista SP0 x86
# IMGPROFILE="--profile=VistaSP1x64"     # Profile for Windows Vista SP1 x64
# IMGPROFILE="--profile=VistaSP1x86"     # Profile for Windows Vista SP1 x86
# IMGPROFILE="--profile=VistaSP2x64"     # Profile for Windows Vista SP2 x64
# IMGPROFILE="--profile=VistaSP2x86"     # Profile for Windows Vista SP2 x86
# IMGPROFILE="--profile=Win2003SP0x86"   # Profile for Windows 2003 SP0 x86
# IMGPROFILE="--profile=Win2003SP1x64"   # Profile for Windows 2003 SP1 x64
# IMGPROFILE="--profile=Win2003SP1x86"   # Profile for Windows 2003 SP1 x86
# IMGPROFILE="--profile=Win2003SP2x64"   # Profile for Windows 2003 SP2 x64
# IMGPROFILE="--profile=Win2003SP2x86"   # Profile for Windows 2003 SP2 x86
# IMGPROFILE="--profile=Win2008R2SP0x64" # Profile for Windows 2008 R2 SP0 x64
# IMGPROFILE="--profile=Win2008R2SP1x64" # Profile for Windows 2008 R2 SP1 x64
# IMGPROFILE="--profile=Win2008SP1x64"   # Profile for Windows 2008 SP1 x64
# IMGPROFILE="--profile=Win2008SP1x86"   # Profile for Windows 2008 SP1 x86
# IMGPROFILE="--profile=Win2008SP2x64"   # Profile for Windows 2008 SP2 x64
# IMGPROFILE="--profile=Win2008SP2x86"   # Profile for Windows 2008 SP2 x86
# IMGPROFILE="--profile=Win7SP0x64"      # Profile for Windows 7 SP0 x64
# IMGPROFILE="--profile=Win7SP0x86"      # Profile for Windows 7 SP0 x86
# IMGPROFILE="--profile=Win7SP1x64"      # Profile for Windows 7 SP1 x64
# IMGPROFILE="--profile=Win7SP1x86"      # Profile for Windows 7 SP1 x86
# IMGPROFILE="--profile=WinXPSP1x64"     # Profile for Windows XP SP1 x64
# IMGPROFILE="--profile=WinXPSP2x64"     # Profile for Windows XP SP2 x64
IMGPROFILE="--profile=WinXPSP2x86"     # Profile for Windows XP SP2 x86
# IMGPROFILE="--profile=WinXPSP3x86"     # Profile for Windows XP SP3 x86

# If processing takes too long to complete, comment out the apihooks command on line54
# The script will echo "Volatility Foundation Volatility Framework 2.3.1" upon successful completion of each command

# Away we go

cd $VOLDIR
date
echo --- Identifying
$PYTHON vol.py imageinfo -f $MEMDUMP > "$CASELIB/imageinfo.txt"

echo --- Processes
$PYTHON vol.py pslist -f $MEMDUMP $IMGPROFILE > "$CASELIB/pslist.txt"
$PYTHON vol.py psscan -f $MEMDUMP $IMGPROFILE > "$CASELIB/psscan.txt"
$PYTHON vol.py pstree -f $MEMDUMP $IMGPROFILE > "$CASELIB/pstree.txt"
$PYTHON vol.py psxview -f $MEMDUMP $IMGPROFILE > "$CASELIB/psxview.txt"
#
echo --- Network Connections
$PYTHON vol.py netscan -f $MEMDUMP $IMGPROFILE > "$CASELIB/netscan.txt"
#
echo --- Malicious Files
$PYTHON vol.py filescan -f $MEMDUMP $IMGPROFILE > "$CASELIB/filescan.txt"
$PYTHON vol.py malfind --dump-dir $MALPROCESS -f $MEMDUMP $IMGPROFILE > "$CASELIB/malfind.txt"
md5 $MALPROCESS/*.dmp > $CASELIB/md5hash_processes.txt
$PYTHON vol.py apihooks -f $MEMDUMP $IMGPROFILE > "$CASELIB/apihooks.txt"
#
echo --- Yara Scan
$PYTHON vol.py -f $MEMDUMP yarascan --yara-file=/opt/yara/master-rules.yara > "$CASELIB/yara-results.txt"
$PYTHON vol.py -f $MEMDUMP yarascan --yara-file=/opt/yara/master-rules.yara -D $MALPROCESS > "$CASELIB/yara-discoveries.txt"
#
echo --- Services Scan
$PYTHON vol.py svcscan -f $MEMDUMP $IMGPROFILE > "$CASELIB/svcscan.txt"
#
echo --- ldr_modules, threads, callbacks
$PYTHON vol.py ldrmodules -f $MEMDUMP $IMGPROFILE  > "$CASELIB/ldr_modules.txt"
$PYTHON vol.py threads -f $MEMDUMP $IMGPROFILE  > "$CASELIB/threads.txt"
$PYTHON vol.py callbacks -f $MEMDUMP $IMGPROFILE  > "$CASELIB/callbacks.txt"
#
echo --- idt, gdt, devicetree
$PYTHON vol.py idt -f $MEMDUMP $IMGPROFILE > "$CASELIB/idt.txt"
$PYTHON vol.py gdt -f $MEMDUMP $IMGPROFILE > "$CASELIB/gdt.txt"
$PYTHON vol.py devicetree -f $MEMDUMP $IMGPROFILE > "$CASELIB/devicetree.txt"
#
echo --- Registry Scan and Discovery
$PYTHON vol.py printkey -K "Software\Microsoft\Windows\CurrentVersion\Run" -f $MEMDUMP $IMGPROFILE > "$CASELIB/run-registry.txt"
$PYTHON vol.py printkey -K "Software\Microsoft\Windows\CurrentVersion\RunOnce" -f $MEMDUMP $IMGPROFILE > "$CASELIB/runonce-registry.txt"
#
echo --- Virustotal API MD5 Comparision - No data is uploaded to the site at this time!
$GREP -e "[0-9a-f]\{32\}" $CASELIB/md5hash_processes.txt | cut -d"=" -f2 > $VTRESULTS/MD5_VT.txt
$PYTHON ~/Documents/Scripts/vtsearch.py $VTRESULTS/MD5_VT.txt > $VTRESULTS/virtuatotal_query_results.csv
date
exit 0



