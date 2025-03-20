#!/bin/bash

invert (){
 echo "*inside func" 
 local file="$1"
 #check existence 
 if [ ! -f "$file" ]; then
  echo "err file does not exist"
  return 1
 fi

 echo "original file:"
 cat  "$file"
 
 mapfile -t lines < "$file"
 for ((i=${#lines[@]}-1; i>=0; i--)); do
   echo "${lines[i]}"
 done > temp_file
 
 mv temp_file "$file"   
 
 echo "new content: ->"
 cat "$file"
}

invert "$1"

