#!/bin/bash

while IFS= read -r target; do
    fallback.sh "$target"
done < $1
