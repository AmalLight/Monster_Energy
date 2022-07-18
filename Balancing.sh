#!/bin/bash

old_pwd=$PWD

cd "$1" && ls . | xargs -I {} bash -c 'du -h "{}" 2>/dev/null' | grep -v /

cd $old_pwd
