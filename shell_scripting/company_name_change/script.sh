#!/bin/bash

if [ -e "./$1" ] && [ -r "./$1" ] && [ -w "./$1" ]; then

  exec 10<&0
  exec < $1

  while read LINE; do

    if [[ ! $LINE =~ (http://www\..+\.com) && $LINE =~ ^(.+)(www\..+\.com)$ ]]; then
      echo "${BASH_REMATCH[1]}http://${BASH_REMATCH[2]}"
    else
      echo $LINE
    fi

  done < $1 > "$1.t"

  mv $1{.t,}
  
  exec 0<&10 10<&-

else
  echo "File $1 doesn't exist or don't have appropriate permissions for read/write."
fi

