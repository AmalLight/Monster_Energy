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
          echo ''
          echo "Repository: $RepoDir" && cd $RepoDir

          if [[ -f backup.sh ]] && [[ -f recovery.sh ]] ;
          then
               echo -n "With backup.sh:   "
               cat backup.sh   | grep Monster_Energy

               echo -n "With recovery.sh: "
               cat recovery.sh | grep Monster_Energy
          fi

          cd .. && echo ''
     fi
done

# ------------------------------------------------------------------

cd $Old_dir && echo ''
