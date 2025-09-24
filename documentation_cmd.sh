get https://www.eggington.net/it_320/amendments.tar.gz

tar -xzvf amendments.tar.gz 

#review file
cat 01
cat 01 02

# we use more to look at the file one page at a time

more 01 02 03 04 05 06 07 08 09 10

# make directory
mkdir tmp

#copy files
cp

# pwd is useful to see where you are. pwd stands for print working directory.
pwd

# cd .. is to move up one directory
cd ..

# cd - is to move back to the previous directory
cd -
# cd is to move to your home directory
cd
# or
cd ~

# piping using >, this make 10 files in to one. 
cat {01..10} > amendments.txt

# fold is to wrap text to a specified width
fold -s -w70 amendments.txt #from class

fold -w 72 amendments.txt > amendments_folded.txt #this is ai comment

#less will let you scroll up and down, hit q to quit. you can search using /word in less
less amendments.txt

# man less to see the manual for less. man stand for manual. in this case it is the manual of less.
man less

# install python3 on linux
sudo apt install python3 #ai comment

sudo yum install python3 python3-pip -y #from class
pip3  install tldr #from class, tldr is a simplified and community, tldr stands for too long didn't read. this is to install tldr. and we can use tldr to see simple manual pages.
tldr less #ai comment
-
vi 11 #vi is a text editor, 11 is the file name. vi is a bit tricky to use. hit i to go into insert mode, hit esc to go back to command mode, type :wq to write and quit, type :q! to quit without saving. :wq stands for write and quit, q! stands for quit without saving.


>> 11 amendments.txt #this will add the content of 11 to amendments.txt

ls -a #list all files including hidden files

#search and replace in vi, :%s/old/new/g
:%s/Amendment/Law/
:%s/amendment/law/g #g is for global, to replace all occurrences in the file.
:%s/amendment/law/"number" #"number" it will show you how many time will be replaced.