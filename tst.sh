DOMAIN=$1
# DIR=$HOME/engagements/$1
DIR=$HOME/Documents/engagements/$1

# ctfr -d $DOMAIN -o $DIR/ctfr.txt
# DIR/live.txt was the culprit it had no prefix for dir hehe 

cat $DIR/amas.txt $DIR/ctfr.txt $DIR/subdomains.txt $DIR/wayback2.txt $DIR/wayback.txt | sort -u |  httpx | anew $DIR/live.txt 