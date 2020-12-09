#!/bin/sh

xcode_cli_installed() {
    xcode-select -p 2>&1 > /dev/null
    if [ "$(echo $?)" -ne "0" ]; then
        echo "Run 'xcode-select --install'" >&2
        exit 1
    fi
}

if [[ "$OSTYPE" == "darwin"* ]]; then
    xcode_cli_installed
else
    echo "Only MacOS is supported" >&2
    exit 1
fi
