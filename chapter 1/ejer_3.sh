#!/bin/bash

compresFile() {
  echo "file location: $name"
  gzip -v "$name" #-v shows compression ratio to know how much spaced saved
  echo "file compressed"
}

deleteFile (){	
  echo "file location: $name"     >> deletedItems.txt
  echo  "deleted on: $(date)"  >> deletedItems.txt
  echo "--------------------" >> deletedItems.txt
        
  rm "$name"
  echo "item deleted!"
}

checkSize (){
  size=100
  actualSize=$(du -k "$name" | cut -f 1) #du=disk usage
  
  if [ "$actualSize" -gt "$size" ]; then
    echo "-----------------"
    echo "$name"
    echo 'file is over 100Kb!'
    echo "-- Press y to delete or c to compress"
    read option 
    
    if [ "$option" = "y" ]; then
      	deleteFile "$name"
    elif [ "$option" = "c" ]; then
      	compresFile "$name"  
    fi 
    echo "-----------------"
    echo " "
  fi
}

#exact same algorithm than exer 2 to look into files
listItems (){
  for name in "$1"/*; do
    if [ -e "$name" ]; then 
      if [ -d "$name" ]; then #ask if there's some other folders
         listItems "$name"; #if there's a folder recall 
      else 
        checkSize
      fi
     else echo "hey!: $name is empty or is inaccesible"
     fi    
  done	
}

listItems "$1"
