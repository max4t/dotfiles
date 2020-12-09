#!/bin/sh

set -e

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

if [ -d "dotfiles" ]; then
    echo "'dotfiles' already exists. Remove it or run 'install.sh'" >&2
    exit 1
fi

git clone git@github.com:max4t/dotfiles.git
cd dotfiles

./install.sh
