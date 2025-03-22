#!/bin/bash

changeName () {
  local name="$1"
  echo "original name: $name"
  if [ -f "$name" ]; then #ask if it's a file
    if  echo "$(basename "$name")" | grep -q '[A-Z]' || echo "$(basename "$name")" | grep -q ' '; then
      echo "*getting filename"
      newFileName=$(basename "$name" | tr 'A-Z' 'a-z' | tr ' ' '_')
      #rebuild the path
      newName="$(dirname "$name")/$newFileName"
      
      if mv  "$name" "$newName"; then #if i could move it
        echo "succes"
        echo "new name: $newName"
        return 0  
      else 
        echo "filename already good!" 
        return 0
      fi
      else 
        echo "err not a file"
        return 1
    fi
    fi
}

#look for all the files in the directory
listItems () {
  local amount=0
  
  for name in "$1"/*; do
    if [ -f "$name" ]; then #for file processing
      if changeName "$name"; then
        amount=$((amount+1)) 
      fi
    fi
  done
    	
  echo "amount of filenames changed $amount"
}

listItems "$1"
