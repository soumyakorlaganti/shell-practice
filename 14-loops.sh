#!/bin/bash

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE=$(($LOGS_FOLDER/$0.log))

if [ $USERID -ne 0 ]; then
    echo "please run the script with root user access" | tee -a $LOGS_FILE
    exit 1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo "$2...FAILURE" | tee -a $LOGS_FILE
        exit 1
    else
        echo "$2...SUCCESS" | tee -a $LOGS_FILE
    fi
}

for package in $@  # sudo sh 14-loops.sh python gcc mysql
do
    dnf install $package -y &>> $LOGS_FILE
    VALIDATE $? "package installation"
done
