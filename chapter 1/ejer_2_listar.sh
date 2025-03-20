#!/bin/bash
#in the exercise it says for Home directory but i will do it for any directory

listItems (){
  echo "-----------------"
  echo "**inside folder**"
  
  for name in "$1"/*; do
    if [ -d "$name" ]; then #ask if there's some other folders
      listItems "$name"; #if there's a folder recall 
    else 
       echo "$name"
       echo "$name" >> listFolder.txt #print the name in the file
    fi
  done
  
  echo "**out of folder**"
  echo "-----------------"	
}

#clear or create the folder if it does not exists
> listFolder.txt
listItems $1
