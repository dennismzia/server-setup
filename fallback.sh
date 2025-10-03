#!/usr/bin/bash

if [[ -z "$1" ]]; then
    echo "USAGE: $0 domain [domain2]"
    exit 1
fi

DOMAIN=$1
DIR=$HOME/engagements/$1
mkdir -p "$DIR"

# DIR=~/engagements/$1

# if [  ! -d "$DIR" ]; then
#     mkdir -p $DIR
# fi

# if [[ $1 = "" ]]; then
#     echo "USAGE: domain [domain domain2]"
#     exit
# fi
# if [[ $2 != "" ]]; then
#     #statements
#     DOMAIN=$2
# elif [[ $2 = "" ]]; then
#     DOMAIN=$1
# fi

echo "live domain search started on  $DOMAIN Relax and chill will probably take a while "
echo ""
echo $DIR


cat $DIR/amas.txt $DIR/ctfr.txt $DIR/subdomains.txt $DIR/wayback2.txt $DIR/wayback.txt | sort -u #|  httpx | anew live.txt 

echo "finished with live probing------------------"
echo "grpahql search initiated"

for i in $(cat live.txt); do echo [$i];graphwoof -d -t $i ; done >> grap2.txt



