mkdir split
cd split
for i in {1..100}; do echo "I can count to $i"; sleep .01; done # this command will create 100 files named 1 to 100, sleep command will wait for 10 milliseconds before creating the next file
for i in {1..100}; do echo "I can count to $i"; sleep .01; done > count.txt # this will create a file named count.txt and will write 100 lines to it

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
#we want to split that file
tldr split #to see the simple version of split command

split -l 10 count.txt count_parts.txt #this command will split the file count.txt into smaller  after the 10th line, so we will have 10 files 
rm count.txt #to remove the original file

#to put back together we use cat
cat count_parts.txta* > count.txt #this will combine all the files into one

rm * #to remove all the files, don't do it in root directory

#download the kjv biile

tar -xzf  kjv.tar.gz #to extract the file
tail kjv.txt #to see the last 10 lines
ls -lh #to see the size of the file

tar -czf - kjv.txt | split -b 500k - kjv.tar.gz.split & #this will split the file into 500kb chunks and save them in kjv.tar.gz.split, the & will run the command in the background

-------------------------------------------------------------------------------------------------------------------------------------------------------------------------
mkdir new

cp kjv.txt new
cd new
vi kjv.txt #this will open the file in vi editor, and we will make a little change on the file.

diff kjv.txt ../kjv.txt #this will show the difference between the two files

#this is the output:

[ec2-user@ip-172-31-19-80 new]$ diff kjv.txt ../kjv.txt
1c1
< KJV The Bible
---
> KJV
[ec2-user@ip-172-31-19-80 new]$ 
