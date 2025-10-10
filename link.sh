# i created a directory name temp2/here/ there i creat a file name Here_Cow.txt

#now I came back to temp2 directory 
ln -s here there
# this command creates a symbolic link named 'there' that points to the 'here' directory
#now when i do cd there/ i will see the Here_Cow.txt file

pwd #to see the current working directory

tldr pwd #to see the simple version of pwd command

pwd -P #to see the physical path without any symbolic links, so here we know that wer are actually in the here directory. so "there"is a symbolic link to "here"

cd / #going to the root directory 

----
#to repare or fix the symbolic link, creat the dirctory you deleted.\
-----
ln Kimchhay_Heng.txt Chhay.txt
#this command creates a hard link named 'Chhay.txt' that points to the same inode as 'Kimchhay_Heng.txt'

ls -li
#this command lists files in the current directory with detailed information, including inode numbers
#so for the hard link, even if you delete the original file, the hard link will still work because it points to the same inode. mean you can still access the file's content through the hard link after the original file is deleted.

----
sudo dnf provides loacate #to find which package provides the locate command, we want to find out which package contains the locate command
sudo dnf install mlocate #to install the mlocate package, which provides the locate command
#[ec2-user@ip-172-31-19-80 ~]$ locate conf
#locate: can not stat () `/var/lib/mlocate/mlocate.db': No such file or directory
#[ec2-user@ip-172-31-19-80 ~]$ sudo updatedb
sudo updatedb #to create or update the mlocate database, which is used by the locate command to quickly find files on the system

locate conf #to search for files and directories that contain the string "conf" in their names
locate conf | grep conf$ #to filter the results of the locate command to show only files and directories that end with "conf"    

locate conf | grep -i aws #to filter the results of the locate command to show only files and directories that contain "aws" in their names, ignoring case sensitivity, -i option makes the search case-insensitive mean it will match "aws", "AWS", "Aws", etc.

locate conf | grep -i aws | grep -v cli #to filter the results of the locate command to show only files and directories that contain "aws" in their names, ignoring case sensitivity, but excluding those that contain "cli". The -v option inverts the match, so it excludes any lines that match "cli"

#how to close the NOTE section

NOTE: 'don't forget to run sudo updatedb command before using locate command to update the database.'
: '

sudo dnf install cups #to install the CUPS (Common Unix Printing System) package, which provides printing services on Unix-like operating systems

locate conf | grep cups | grep -v -e "templates" -e "man" #to filter the results of the locate command to show only files and directories that contain "cups" in their names, excluding those that contain "

sudo find / -name "*.conf" #to search for all files and directories in the system that have the ".conf" extension

sudo find / -name "*.conf" | wc -l #to count the number of files and directories that have the ".conf" extension

sudo find / -name "*.conf" -size +2k -mtime -30 #to search for all files and directories in the system that have the ".conf" extension, are larger than 2 kilobytes, and have been modified in the last 30 days

#if you have error, do this
sudo find / -name "*.conf" -size +2k -mtime -30 2> /dev/null #to search for all files and directories in the system that have the ".conf" extension, are larger than 2 kilobytes, and have been modified in the last 30 days, while redirecting any error messages to /dev/null to suppress them

sudo find / -name "*.conf" -size +2k -mtime -30 2> /dev/null | xargs ls -ltrah #to search for all files and directories in the system that have the ".conf" extension, are larger than 2 kilobytes, and have been modified in the last 30 days, while redirecting any error messages to /dev/null to suppress them, and then listing the details of those files using ls -ltrah command

sudo find / -name "*.conf" -size +1k -mtime -90 2> /dev/null -exec ls -ltrah {} \; #same, to search for all files and directories in the system that have the ".conf" extension, are larger than 1 kilobyte, and have been modified in the last 90 days, while redirecting any error messages to /dev/null to suppress them, and then executing the ls -ltrah command on each of those files individually using the -exec option