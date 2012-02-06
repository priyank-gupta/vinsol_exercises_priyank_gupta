#!/bin/bash

P=/home/priyank/vinsol_exercises_priyank_gupta/shell_scripting/version_change/project/abc

if [ ! -d "$P/2.0" ]; then
  A=$( mkdir "$P/2.0" )
  B=$( mkdir "$P/2.0/code" )
fi

for f in $( ls "$P/1.0/code" ); do
	sed '1s/.*/version:2.0/' "$P/1.0/code/$f" > "$P/2.0/code/$f"
done 
