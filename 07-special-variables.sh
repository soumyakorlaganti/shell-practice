#!/bin/bash

#### special variables ####
echo "all variables passed to script: $@"
echo "no.of variables passed to script: $#"
echo "script name: $0"
echo "current working directory: $PWD"
echo "who is running this script: $USER"
echo "home directory of current user: $HOME"
echo "hostname: $HOSTNAME"
echo "Process ID of the current shell script: $$"
sleep 100 &
echo "PID of recently executed background process: $!"
echo "all arguments passed to script: $*"
echo "current shell flags/options: $-"
echo "exit status of previous command: $?"