#!/bin/bash

git config --global alias.hist 'log --oneline --graph --decorate --all'
git status
git fetch  --all
git reset  --hard origin/main
git hist

number=$1 ; path_name=$2

mkdir           -p  ../backups
rm              -rf ../backups/backup$number ; sync
cp -r ../$path_name ../backups/backup$number ; sync
