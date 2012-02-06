#!/bin/bash

if [ -e "./$1" ] && [ -r "./$1" ] && [ -w "./$1" ]; then

  while read LINE; do

    if [[ ! $LINE =~ (http://www\..+\.com) && $LINE =~ ^(.+)(www\..+\.com)$ ]]; then
      echo "${BASH_REMATCH[1]}http://${BASH_REMATCH[2]}"
    else
      echo $LINE
    fi

  done < $1 > "$1.t"

  mv $1{.t,}
  
else
  echo "File $1 doesn't exist or don't have appropriate permissions for read/write."
fi

