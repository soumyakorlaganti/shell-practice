#!/bin/bash

set -e # ERR

# trap 'handle_error ${LINENO} "${BASH_COMMAND}"' ERR
# used to find the error with line number and particular command
trap 'echo "There is an error in $LINENO, Command: $BASH_COMMAND"' ERR

echo "Hello"
echo "where are you"
echoo "I am at bank"
echo "come fast"