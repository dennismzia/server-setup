#!/bin/bash

while IFS= read -r target; do
    ./subdomain.sh "$target"
done < targets.txt
