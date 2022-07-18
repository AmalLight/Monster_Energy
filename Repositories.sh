#!/bin/bash

reset

Old_dir="$PWD"

echo ''

# ------------------------------------------------------------------

while ! [[ "$PWD" == *"/Git" ]] ;
do
    cd .. ; # global Git directory
done

tree -L 1 && echo 'sleep 1' && sleep 1

echo ''

# ------------------------------------------------------------------

rm -rf $Old_dir/repo.list && touch $Old_dir/repo.list

count=0

for RepoDir in $(ls .)
do
     if ! [[ "$RepoDir" == *"backup"* ]] ;
     then
          count=$((count+1))
     
          echo "# Repository: $RepoDir"
          echo "git clone https://github.com/AmalLight/$RepoDir" | tee -a $Old_dir/repo.list
          echo ''
     fi
done

echo ''                                 | tee -a $Old_dir/repo.list
echo "count for valid folders : $count" | tee -a $Old_dir/repo.list

# ------------------------------------------------------------------

cd $Old_dir && echo ''
