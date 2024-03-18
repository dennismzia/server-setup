# script for brute forcing second  level subdomains hence the name

max_concurrent=5  # Adjust this value based on your server's resources

exec 3<$1

counter=1
while IFS= read -r DOMAIN <&3; do
    {
        nohup puredns bruteforce /opt/wordlist/best-dns-wordlist.txt "$DOMAIN" -r /opt/wordlist/resolvers.txt -w subrute_${counter}.txt --write-wildcards "wildcards_${counter}.txt" --write-massdns "from_massdns_${counter}.txt" > "sbr2_${counter}.txt"
    } &
    ((counter++))

    # Check if the maximum number of concurrent processes has been reached
    if ((counter % max_concurrent == 0)); then
        wait
    fi
done

# Wait for any remaining background processes to finish
wait

# Close the file descriptor
exec 3<&-