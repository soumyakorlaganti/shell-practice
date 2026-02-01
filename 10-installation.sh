#!/bin/bash

USERID=$(id -u)

if [ $USERID -ne 0 ]; then
    echo "please run the script with root user access"
    exit 1
fi

echo "installing nginx"

dnf install nginx -y
if [ $? -ne 0 ]; then
    echo "installing nginx...FAILURE"
    exit 1
else
    echo "installing nginx...SUCCESS"
fi

dnf install mysql -y
if [ $? -ne 0 ]; then
    echo "insalling MySQL...FAILURE"
    exit 1
else
    echo "installing MySQL...SUCCESS"
fi

dnf install nodejs -y
if [ $? -ne 0 ]; then
    echo "installing nodejs...FAILURE"
    exit 1
else
    echo "installing nodejs...SUCCESS"
fi