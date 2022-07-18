#!/bin/bash

number=$1 ; path_name=$2

cd ..
mkdir -p backups/backup$number && rm -rf $path_name ; sync
cp    -r backups/backup$number           $path_name ; sync
