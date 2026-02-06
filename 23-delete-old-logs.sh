#!/bin/bash

B="\e[30m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
P="\e[35m"
C="\e[36m"
N="\e[0m"

LOGS_DIR=/home/ec2-user/app-logs # we have to delete logs inside this folder
LOGS_FILE="$LOGS_DIR/$0.log"

# Checking if directory exist or not

if [ ! -d $LOGS_DIR ]; then
    echo -e "$LOGS_DIR does not exist"
    exit 1
fi

# Finding files older than 14days

FILES_TO_DELETE=$(find $LOGS_DIR -name "*.log" -mtime +14)
#echo "$FILES_TO_DELETE"

while IFS= read -r filepath; do 
 # Process each line here
 echo "Deleting file: $filepath"
 rm -f $filepath
 echo "Deleted file: $filepath"
done <<< $FILES_TO_DELETE # Take this as input ,read line by line seperately then print it.
