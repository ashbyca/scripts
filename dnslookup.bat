REM Author - Christopher Ashby
REM Last Updated - 20190124

REM This script basically performs large lookups and writes all the information to a results file. It’s basic but works great, it’s 
REM intended to work on any Windows computer.

REM Prior to use, the following modifications will need to be made:

REM 1. Change the value with the absolute path where the script is located
REM 2. Change ns1 and ns2 to include your DNS servers
REM 3. Change the endpoint1 and endpoint2 values to include the hostnames you wish to perform a lookup against

REM After you save the file, execute the script. Once completed, you will have a txt file that contains the complete results.
REM Any error's will be displayed in the command window.


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
