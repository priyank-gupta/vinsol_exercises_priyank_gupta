#!/bin/bash

if [ -e "./$1" ] && [ -r "./$1" ]; then

  sed 's_\( \)\(www\..\+\.com\)_\1http://\2_' $1>temp.txt
  mv temp.txt $1
  
else
  echo "File $1 doesn't exist or don't have appropriate permissions for read/write."
fi

