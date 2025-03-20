#!/bin/bash
echo "putside"
placeForNumber() {
    echo "you just enter the function"	
    # Define a local var
    local num="$1"  # Assign the first param to a local var
    echo "The number is: $num"

    # Check if the file exists
    if [ -f "$2" ]; then
        echo "File does exist"
    else
        echo "File does not exist"
        exit 1
    fi

    echo "Content of the file:"
    cat "$2"

    # Replace new data
    tr '[:print:]' "$num" < "$2" > temp_file && mv temp_file "$2"

    echo "New content:"
    cat "$2"
}

placeForNumber "$1" "$2"
