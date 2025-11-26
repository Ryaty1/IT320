#the chicken:

-----
#!/bin/bash

#Define Vriables
#
FILE="chicken"

# Loop to check if the file exists

while true; do
       if [ -f "$FILE" ]; then
                echo "The file $FILE exists!"
                break # Exit the loop when file is found.
        else
                echo "The file named $FILE has not been found."
                break # break if the file has not been found.
        fi
done

echo "Chicken Check Complete!"
------


echo "The script exited with status code: $?" #expspect 0

---

 vi new.sh

 ----
 #!/bin/bash

echo "You typed $# arguments."

echo

        if [ $# -eq 0 ]; then
                echo "You gave no arguments :("
        else
                echo "Here are the arguments you gave me"
                echo "1st - '$1'"
                echo "2nd - '$2'"
                echo "3rd - '$3'"
                echo "All of them - $*"
        fi


 ----
 mv new.sh number_arguments.sh


chmod +x number_arguments.sh 

---
#test the script:


./number_arguments.sh frannk #the argument is frannk
echo "The script exited with status code: $?" #expect 0