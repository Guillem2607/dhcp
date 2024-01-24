#!/bin/bash

# Select the file to backup
file=$(ls /etc/dhcp | fzf)
# Verify if the user canceled the selection
if [ $? -eq 1 ]; then
  echo "Selección del primer archivo cancelada por el usuario."
  exit 1
fi

# Counting function
count(){
    count=1
    while [ -e "$file.$count" ]; do
    ((count++))
    done

    copy=$file.$count
    cp -r $file /etc/dhcp/backups/$copy
}

# Call the function
count
