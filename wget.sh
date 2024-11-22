#!/bin/bash

# List of URLs to download
urls=(
    "https://registry.npmjs.org/set-blocking/-/set-blocking-2.0.0.tgz"
    "https://registry.npmjs.org/require-main-filename/-/require-main-filename-2.0.0.tgz"
    "https://registry.npmjs.org/p-try/-/p-try-2.2.0.tgz"
    "https://registry.npmjs.org/sprintf-js/-/sprintf-js-1.0.3.tgz"
    "https://registry.npmjs.org/is-plain-obj/-/is-plain-obj-2.1.0.tgz"
    "https://registry.npmjs.org/esprima/-/esprima-4.0.1.tgz"
)

# Output directory for downloaded files
output_dir="./downloads"
mkdir -p "$output_dir"

# Download each file with `wget` and `strace`
for url in "${urls[@]}"; do
    file_name=$(basename "$url")
    strace -e trace=network,open,read,write wget -d -O "${output_dir}/${file_name}" "$url"
done
