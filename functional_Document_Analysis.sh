#!/bin/bash

Validator () {

    while true
    do
         read -t 5 passed

         if ! (( ${#passed} > 3 )) ; then break ; fi # >= NLP

         if [[ "$passed" != *"'"* && "$passed" != *'"'* ]] ;
         then
              echo "$passed"
         else
              echo '/root/'
         fi

         passed=''

    done
}

export -f Validator

# echo "$(find ../ -type f)" | xargs -I {} bash -c " echo '{}' "

# echo "$(find ../ -type f)" | Validator | xargs -I {} bash -c " echo '{}' "

echo "$(find ../ -type f)" | Validator | xargs -I {} bash -c "file '{}' | grep text && cat '{}' | grep '$@' "
