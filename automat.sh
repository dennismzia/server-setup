#!/bin/bash

while IFS= read -r target; do
    subdomains.sh "$target"
done < $1
