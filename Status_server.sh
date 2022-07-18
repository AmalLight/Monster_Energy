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

for RepoDir in $(ls .)
do
     if ! [[ "$RepoDir" == *"backup"* ]] ;
     then
          echo "Repository: $RepoDir"
          echo "With status:"

          cd $RepoDir && git status
          cd ..

          echo ''
     fi
done

# ------------------------------------------------------------------

cd $Old_dir && echo ''
