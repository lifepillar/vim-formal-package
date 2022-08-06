#!/usr/bin/env bash
set -u

CURDIR=$(dirname -- $(realpath "$0"))
cd $CURDIR

# Remove the plugin directories from .gitignore
sed -i '/autoload/d' .gitignore
sed -i '/compiler/d' .gitignore
sed -i '/ftdetect/d' .gitignore
sed -i '/ftplugin/d' .gitignore
sed -i '/indent/d' .gitignore
sed -i '/syntax/d' .gitignore

# Delete the plugin structure
rm -rf autoload compiler ftdetect ftplugin indent syntax