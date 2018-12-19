@echo off
if exist <dir>nsresults.txt del nsresults.txt

:: list of name servers
for %%i in (ns1
ns2) do (

:: list of sites
for %%j in (endpoint1
endpoint2) do (

for /f "tokens=1*" %%k in ('nslookup %%j %%i') do (
if [%%k]==[Server:] set server=%%l
if [%%k]==[Address:] set address=%%l
if [%%k]==[Addresses:] set address=%%l
if [%%k]==[Name:] set name=%%l)
call echo %date%, %time%, %%j, %%name%%, %%address%% >><dir>nsresults.txt
)
) 
