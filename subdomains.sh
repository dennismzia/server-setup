#!/usr/bin/bash

# d=$(date +"%m-%d-%Y")
# DIR=$HOME/Documents/engagements/$1
DIR=$HOME/engagements/$1
DOMAIN=$1

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

echo "subdomain probe started on $DOMAIN relax will probably take a while "
echo "started subfinder"
subfinder -all -silent -d $DOMAIN |sort -u|anew $DIR/subdomains.txt
echo "started assetfinder"
assetfinder -subs-only $DOMAIN |sort -u|anew $DIR/subdomains.txt

echo "started githubsubdomains"
github-subdomains -d example.com -t /opt/gh/tokens.txt -o $DIR/output.txt

echo "checking subs from wayback"
waybackurls example.com |  unfurl -u domains | sort -u | anew $DIR/wayback.txt
echo "checking subs via gauplus"
gauplus --threads 5 --subs example.com |  unfurl -u domains | sort -u |anew $DIR/wayback2.txt

echo " started ctfr \n"
ctfr.py -d $DOMAIN -o $DIR/ctfr.txt

echo "\n started enum on amass \n"
amass enum --passive -d $DOMAIN -o $DIR/amas.txt

echo "performing dns bruteforcing"
nohup puredns bruteforce ~/wordlist/best-dns-wordlist.txt $DOMAIN -r ~/wordlist/resolvers.txt -w subrute.txt > sbr & 
echo " "
echo "------------------------------------------------------------------------------------"
echo "done and dusted"

# echo "subdomain discovery finished starting js file extraction process. might take a while :)"
# cat $DIR/subdomains.txt| gauplus -b ttf,woff,svg,png,jpg  -random-agent |deduplicate|sort -u | grep \.js |anew $DIR/urls.txt
# cat $DIR/subdomains.txt| waybackurls|deduplicate |sort -u| grep \.js |anew $DIR/urls.txt
# echo " "
# echo "extraction process done and saved in $DIR. now finding live js files"
# cat $DIR/urls.txt | httpx --silent -mc 200 |anew $DIR/jsurls.txt
