#!/bin/bash

echo "Student: Kimchhay"
echo

echo "You typed $# arguments."
echo

if [ $# -eq 0 ]; then
    echo "You gave no arguments :("
    exit 1
fi

if [[ " $* " == *" fail "* ]]; then
    echo "Input contains the keyword 'fail'! Exiting."
    exit 2
fi

echo "Here are the arguments you gave me"
echo "1st - '$1'"
echo "2nd - '$2'"
echo "3rd - '$3'"
echo "All of them - $*"
echo "Success: All checks passed!"
exit 0
