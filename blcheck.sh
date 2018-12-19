#!/bin/sh
#
# Check if an IP address is listed on one of the following blacklists
# The shell will strip multiple whitespace 

# Below is a link to a quick script I created to quickly idenify if a public routable IP address was listed on any blacklists. 
# The script is easy to use and only takes a single IP address as an argument.

BLISTS=" 
    cbl.abuseat.org
    dnsbl.sorbs.net
    bl.spamcop.net
    zen.spamhaus.org
    3y.spam.mrs.kithrup.com
    access.redhawk.org
    all.rbl.kropka.net
    all.spamblock.unit.liu.se
    assholes.madscience.nl
    bl.borderworlds.dk
    bl.csma.biz
    bl.redhatgate.com
    bl.spamcannibal.org
    bl.spamcop.net
    bl.starloop.com
    blackholes.five-ten-sg.com
    blackholes.sandes.dk
    blackholes.uceb.org
    blackholes.wirehub.net
    blacklist.sci.kun.nl
    blacklist.spambag.org
    block.dnsbl.sorbs.net
    blocked.hilli.dk
    blocklist.squawk.com
    blocklist2.squawk.com
    cart00ney.surriel.com
    cbl.abuseat.org
    dev.null.dk
    dews.qmail.org
    dialup.blacklist.jippg.org
    dialup.rbl.kropka.net
    dialups.mail-abuse.org
    dialups.visi.com
    dnsbl.ahbl.org
    dnsbl.antispam.or.id
    dnsbl.cyberlogic.net
    dnsbl.kempt.net
    dnsbl.njabl.org
    dnsbl.solid.net
    dnsbl.sorbs.net
    dnsbl-1.uceprotect.net
    dnsbl-2.uceprotect.net
    dnsbl-3.uceprotect.net
    dsbl.dnsbl.net.au
    duinv.aupads.org
    dul.dnsbl.sorbs.net
    dul.ru
    dun.dnsrbl.net
    dynablock.njabl.org
    dynablock.wirehub.net
    fl.chickenboner.biz
    forbidden.icm.edu.pl
    form.rbl.kropka.net
    hil.habeas.com
    http.dnsbl.sorbs.net
    http.opm.blitzed.org
    intruders.docs.uu.se
    ip.rbl.kropka.net
    korea.services.net
    l1.spews.dnsbl.sorbs.net
    l2.spews.dnsbl.sorbs.net
    lame-av.rbl.kropka.net
    list.dsbl.org
    mail-abuse.blacklist.jippg.org
    map.spam-rbl.com
    misc.dnsbl.sorbs.net
    msgid.bl.gweep.ca
    multihop.dsbl.org
    no-more-funn.moensted.dk
    ohps.bl.reynolds.net.au
    ohps.dnsbl.net.au
    omrs.bl.reynolds.net.au
    omrs.dnsbl.net.au
    op.rbl.kropka.net
    opm.blitzed.org
    or.rbl.kropka.net
    orbs.dorkslayers.com
    orid.dnsbl.net.au
    orvedb.aupads.org
    osps.bl.reynolds.net.au
    osps.dnsbl.net.au
    osrs.bl.reynolds.net.au
    osrs.dnsbl.net.au
    owfs.bl.reynolds.net.au
    owfs.dnsbl.net.au
    owps.bl.reynolds.net.au
    owps.dnsbl.net.au
    pdl.dnsbl.net.au
    probes.dnsbl.net.au
    proxy.bl.gweep.ca
    psbl.surriel.com
    pss.spambusters.org.ar
    rbl.cluecentral.net
    rbl.rangers.eu.org
    rbl.schulte.org
    rbl.snark.net
    rbl.triumf.ca
    rblmap.tu-berlin.de
    rdts.bl.reynolds.net.au
    rdts.dnsbl.net.au
    relays.bl.gweep.ca
    relays.bl.kundenserver.de
    relays.dorkslayers.com
    relays.mail-abuse.org
    relays.nether.net
    relays.visi.com
    ricn.bl.reynolds.net.au
    ricn.dnsbl.net.au
    rmst.bl.reynolds.net.au
    rmst.dnsbl.net.au
    rsbl.aupads.org
    satos.rbl.cluecentral.net
    sbl.csma.biz
    sbl.spamhaus.org
    sbl-xbl.spamhaus.org
    smtp.dnsbl.sorbs.net
    socks.dnsbl.sorbs.net
    socks.opm.blitzed.org
    sorbs.dnsbl.net.au
    spam.dnsbl.sorbs.net
    spam.dnsrbl.net
    spam.olsentech.net
    spam.wytnij.to
    spamguard.leadmon.net
    spamsites.dnsbl.net.au
    spamsources.dnsbl.info
    spamsources.fabel.dk
    spamsources.yamta.org
    spews.dnsbl.net.au
    t1.bl.reynolds.net.au
    t1.dnsbl.net.au
    ucepn.dnsbl.net.au
    unconfirmed.dsbl.org
    vbl.messagelabs.com
    vox.schpider.com
    web.dnsbl.sorbs.net
    whois.rfc-ignorant.org
    will-spam-for-food.eu.org
    wingate.opm.blitzed.org
    xbl.spamhaus.org
    zombie.dnsbl.sorbs.net
    ztl.dorkslayers.com
"

# simple shell function to show an error message and exit
#  $0  : the name of shell script, $1 is the string passed as argument
# >&2  : redirect/send the message to stderr

ERROR() {
  echo $0 ERROR: $1 >&2 
  exit 2
}

# -- Sanity check on parameters
[ $# -ne 1 ] && ERROR 'Please specify a single IP address'

# -- if the address consists of 4 groups of minimal 1, maximal digits, separated by '.' 
# -- reverse the order
# -- if the address does not match these criteria the variable 'reverse will be empty'
 
reverse=$(echo $1 |sed -ne "s~^\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)\.\([0-9]\{1,3\}\)$~\4.\3.\2.\1~p")

if [ "x${reverse}" = "x" ] ; then
      ERROR  "IMHO '$1' doesn't look like a valid IP address" 
      exit 1
fi  

# Assuming an IP address of 11.22.33.44 as parameter or argument

# If the IP address in $0 passes our crude regular expression check, 
# the variable  ${reverse} will contain the 44.33.22.11 address
# In this case the test will be:
#   [ "x44.33.22.11" = "x" ]
# This test will fail and the program will continue

# An empty '${reverse}' means that shell argument $1 doesn't pass our simple IP address check 
# In that case the test will be:
#   [ "x" = "x" ] 
# This evaluates to true, so the script will call the ERROR function and quit 

# -- do a reverse ( address -> name) DNS lookup

REVERSE_DNS=$(dig +short -x $1)

echo IP $1 NAME ${REVERSE_DNS:----}

# -- cycle through all the blacklists 
for BL in ${BLISTS} ; do
 
    # print the UTC date (without linefeed)
    printf $(env TZ=UTC date "+%Y-%m-%d_%H:%M:%S_%Z")

    # show the reversed IP and append the name of the blacklist
    printf "%-40s" " ${reverse}.${BL}." 

    # use dig to lookup the name in the blacklist 
    #echo "$(dig +short -t a ${reverse}.${BL}. |  tr '\n' ' ')"
    LISTED="$(dig +short -t a ${reverse}.${BL}.)"
    echo ${LISTED:----}

done
# --- EOT ------
