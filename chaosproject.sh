#!/usr/bin/bash

if [[ -z "$1" ]]; then
    echo "USAGE: $0 domain [domain2]"
    exit 1
fi

# files from chaos project already contain subdomains so its just live domain checks and graphql bruteforcing

DOMAIN=$1
DIR=$HOME/Documents/engagements/$1
mkdir -p "$DIR"

echo "live domain search started on  $DOMAIN Relax and chill will probably take a while "
echo ""
echo $DIR


# cat $DIR/amas.txt $DIR/ctfr.txt $DIR/subdomains.txt $DIR/wayback2.txt $DIR/wayback.txt | sort -u |  httpx | anew $DIR/live.txt 
cat $DIR/$DOMAIN.txt| sort -u |  httpx | anew $DIR/live.txt 

echo "finished with live probing------------------"
echo "grpahql search initiated"

for i in $(cat $DIR/live.txt); do echo [$i];graphwoof -d -t $i ; done >> $DIR/grap2.txt



