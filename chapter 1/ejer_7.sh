#!/bin/bash

countImports(){
	local file="$1"
	if [ -f "$file" ]; then 
		echo "amount of imports on file basename($file):" >> inform
		#i used head because in java files imports use to be in the firsts lines
		head -n 40 "$file" | grep "^import" | wc -l >> inform
		echo "----------" >> inform
	fi
}

#iterate over directory files
iterateDir() {
   local file="$1"
	for name in "$file"/*; do
		if [ -e "$name" ]; then
			if [ -d "$name" ]; then 
				iterateDir 	"$name"
			else 
				if echo "$name"  | grep -q "\.java"; then #check for .java extension
					echo "java file found!"
					countImports "$name" inform
				fi
			fi
			else 
				 echo "Archive is empty or inaccessible :s"
		fi
	done 
}

> inform

iterateDir "$1" inform
