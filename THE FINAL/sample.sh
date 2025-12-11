#!/bin/bash
# This is a shell of a script to help with the web assignment

# I like to put variables at the top so you may do that here

#Sample of assigning variables and they are not the same
a=`ls`
b=$(ls)

#Maybe some code to get the website unless you did that with a variable
#You can use curl or wget

echo $a
echo $b


#You will need a loop to know if it is up or down. You can do this in many ways.
if [ $a == $b ]
then
   echo "What to put here 1"
#  Anything else I need to do?
else
   echo "What to put here 2"
#  Anything else I need to do? 
fi
