grep -e # This script is intended to use grep with a regular expression pattern."$1" "$2" ....

-----

 wget https://www.eggington.net/it_320/kjv.tar.gz # Download a tar.gz file from the specified URL

 ls -lsh # List the details of the downloaded file

tar -xzvf kjv.tar.gz # Extract the contents of the tar.gz file

grep -i Jesus kjv.txt | wc -l # Count the number of occurrences of the word "Jesus" in the file, ignoring case
egrep -i "Jesus Christ" kjv.txt | wc -l # Count the number of occurrences of the phrase "Jesus Christ" in the file, ignoring case
grep -o -i 'Jesus' kjv.txt | wc -l # Count the number of occurrences of the word "Jesus" in the file, ignoring case, using the -o option to output each match on a new line

egrep 'Blessed are' kjv.txt | wc -l # Count the number of occurrences of the phrase "Blessed are" in the file

egrep 'Blessed are' kjv.txt 
# Output all lines containing the phrase "Blessed are" from the file

egrep -B 3 'Blessed are' kjv.txt 
# Output all lines containing the phrase "Blessed are" from the file, including 3 lines before each match

egrep 'Matthew 5:3[^0-9]' kjv.txt
# Output lines containing "Matthew 5:3" not followed by another digit (0-9 in this case)
egrep -A 8 'Matthew 5:3[^0-9]' kjv.txt
# Output lines containing "Matthew 5:3" not followed by another digit (0-9 in this case), including 8 lines after each match

egrep -A 8 'Matthew 5:3[^0-9]' kjv.txt | fold -s -w70
# Output lines containing "Matthew 5:3" not followed by another digit (0-9 in this case), including 8 lines after each match, and format the output to wrap at 70 characters

egrep -A 8 'Matthew 5:3[^0-9]' kjv.txt > Beautitudes.txt
# Output lines containing "Matthew 5:3" not followed by another digit (0-9 in this case), including 8 lines after each match, and save the output to a file named Beautitudes.txt

-----
regex101.com
----