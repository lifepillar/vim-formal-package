#!/usr/bin/env bash
set -u

CURDIR=$(dirname -- $(realpath "$0"))
cd $CURDIR

# Copy the files into a plugin structure
cp -r start/*/* .

touch -a .gitignore
# Add the plugin directories to .gitignore
grep -qxF 'autoload/' .gitignore || echo 'autoload/' >> .gitignore
grep -qxF 'compiler/' .gitignore || echo 'compiler/' >> .gitignore
grep -qxF 'ftdetect/' .gitignore || echo 'ftdetect/' >> .gitignore
grep -qxF 'ftplugin/' .gitignore || echo 'ftplugin/' >> .gitignore
grep -qxF 'indent/' .gitignore || echo 'indent/' >> .gitignore
grep -qxF 'syntax/' .gitignore || echo 'syntax/' >> .gitignore