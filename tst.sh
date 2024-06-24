DOMAIN=$1
DIR=$HOME/engagements/$1

ctfr -d $DOMAIN -o $DIR/ctfr.txt

cat $DIR/amas.txt $DIR/ctfr.txt $DIR/subdomains.txt $DIR/wayback2.txt $DIR/wayback.txt | sort -u |  httpx | anew live.txt 