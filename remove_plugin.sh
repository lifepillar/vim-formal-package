#!/usr/bin/env bash
set -u

CURDIR=$(dirname -- $(realpath "$0"))
cd $CURDIR

# Remove the plugin directories from .gitignore
sed -i'' -e '/autoload/d' .gitignore
sed -i'' -e '/compiler/d' .gitignore
sed -i'' -e '/ftdetect/d' .gitignore
sed -i'' -e '/ftplugin/d' .gitignore
sed -i'' -e '/indent/d' .gitignore
sed -i'' -e '/syntax/d' .gitignore

# Delete the plugin structure
rm -rf autoload compiler ftdetect ftplugin indent syntax
