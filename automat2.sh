#!/bin/bash

while IFS= read -r target; do
    ./chaosproject.sh "$target"
done < $1
