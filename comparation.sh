#!/bin/bash

# Selects the first file to compare with 
file1=$(ls /etc/dhcp | fzf)
# Verify if the user canceled the selection
if [ $? -eq 1 ]; then
  echo "The selection of the first file has been canceled by the user."
  exit 1
fi

# Selects the second file to compare with 
file2=$(ls /etc/dhcp | fzf)

# Verify if the user canceled the selection
if [ $? -eq 1 ]; then
  echo "The selection of the second file has been canceled by the user."
  exit 1
fi

# Use Meld to compare both files
meld $file1 $file2
