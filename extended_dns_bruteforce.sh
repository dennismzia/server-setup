DIR=$HOME/engagements/$1
while IFS= read -r DOMAIN; do 
    puredns bruteforce ~/wordlist/best-dns-wordlist.txt $DOMAIN -r ~/wordlist/resolvers.txt -w subrute.txt --write-wildcards wildcards.txt --write-massdns from_massdns.txt
done < wildcards.txt