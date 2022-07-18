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

file_with_memory () {

    fileargv="$PWD/${1:2:999}"

    echo -n "$fileargv|||" && file "$fileargv"
}

find_youtube () {

     fileargv="$1"

     if [[ "$fileargv" == *"text"* ]] ;
     then
           readarray -d "|||" -t Memory_file <<< "$fileargv"
          
           out=` cat "$Memory_file" | grep 'https://www.youtube.com' | grep ' - ' `

           for line in $out
           do
               match=` echo $line | grep https `
               
               if (( ${#match} > 0 )) ; then echo 1 >> counter2.tmp ; fi
           done
           
           if (( ${#out} > 3 )) ; then

              # echo "$Memory_file"
              echo "${out//<br>/}"
              # echo ''
              
              echo 1 >> counter1.tmp
           fi
     fi
}

export -f find_youtube

rm -f counter1.tmp counter2.tmp
touch counter1.tmp counter2.tmp

while read -r fname ;
do
     if [[ "$fname" != *"/backup"* ]] && [[ "$fname" != *"Playlist.sh" ]] ;
     then
          file_with_memory $fname | \

          xargs -I {} bash -c 'find_youtube "{}" ' 2> /dev/null
     fi

done <<< "`find .`"

# ------------------------------------------------------------------

numb1=0 ; for line in `cat ./counter1.tmp` ; do numb1=$((numb1+1)) ; done
numb2=0 ; for line in `cat ./counter2.tmp` ; do numb2=$((numb2+1)) ; done

echo '' && echo "Music Collections: $numb1"
echo '' && echo "Music Count Files: $numb2"

# ------------------------------------------------------------------

rm -f counter1.tmp counter2.tmp

cd $Old_dir && echo ''
