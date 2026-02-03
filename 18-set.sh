#!/bin/bash

set -e #  this will be checking for errors, if error occurs it will exit

USERID=$(id -u)
LOGS_FOLDER="/var/log/shell-script"
LOGS_FILE="$LOGS_FOLDER/$0.log"
B="\e[30m"
R="\e[31m"
G="\e[32m"
Y="\e[33m"
B="\e[34m"
P="\e[35m"
C="\e[36m"
N="\e[0m"

if [ $USERID -ne 0 ]; then
    echo -e "$R please run the script with root user access $N" | tee -a &>> $LOGS_FILE
    exit1
fi

mkdir -p $LOGS_FOLDER

VALIDATE(){
    if [ $1 -ne 0 ]; then
        echo -e "$2...$R FAILURE $N" | tee -a $LOGS_FILE
        exit 1
    else
        echo -e "$2...$G SUCCESS $N" | tee -a $LOGS_FILE
    fi
}

for package in $@
do
    dnf list installed $package &>> $LOGS_FILE
    if [ $? -ne 0 ]; then
        echo "$package not installed, installing now"
        dnf install $package -y &>> $LOGS_FILE
        VALIDATE $? "$package installation"
    else
        echo -e "$package already installed...$Y skipping $N"
    fi  
done