#!/usr/bin/bash

DOMAIN=$1
DIR=$HOME/engagements/$1

if [  ! -d "$DIR" ]; then
    mkdir -p $DIR
fi
if [[ $1 = "" ]]; then
    echo "USAGE: domain [domain domain2]"
    exit
fi
if [[ $2 != "" ]]; then
    #statements
    DOMAIN=$2
elif [[ $2 = "" ]]; then
    DOMAIN=$1
fi

echo "subdomain probe started on $DOMAIN Relax and chill will probably take a while "
echo ""
echo "started subfinder"
subfinder -all -silent -d $DOMAIN |sort -u|anew $DIR/subdomains.txt

echo "started assetfinder"
assetfinder -subs-only $DOMAIN |sort -u|anew $DIR/subdomains.txt

echo "checking subs from wayback"
waybackurls $DOMAIN |  unfurl -u domains | sort -u | anew $DIR/wayback.txt

echo "checking subs via gauplus"
gauplus -t 5 --subs $DOMAIN |  unfurl -u domains | sort -u |anew $DIR/wayback2.txt

echo " started ctfr \n" 
ctfr -d $DOMAIN -o $DIR/ctfr.txt

echo "\n started enum on amass \n"
amass enum --passive -d $DOMAIN -o $DIR/amas.txt

echo " "
echo "------------------------------------------------------------------------------------"
echo "subdomain enum finito "
echo ""
echo "-------------------------------------------------------------------------------------"
echo "Live subs checking and graphql Search initiated"

# cat $DIR/*.txt | sort -u | httpx | anew live.txt && for i in $(cat live.txt); do echo [$i];graphwoof -d -t $i ; done >> grap2.txt

cat $DIR/amas.txt $DIR/ctfr.txt $DIR/subdomains.txt $DIR/wayback2.txt $DIR/wayback.txt | sort -u |  httpx | anew live.txt 

echo "finished with live probing------------------"
echo "grpahql search initiated"

for i in $(cat $DIR/live.txt); do echo [$i];graphwoof -d -t $i ; done >> $DIR/grap2.txt



