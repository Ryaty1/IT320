#upload site.tar to ec2 server to work on it
scp -i "IT320.pem" "site.tar" ec2-user@54.221.21.40:/home/ec2-user

# for this time run, to upload site.tar to ec2 server at home directory
scp -i /Users/kimchhayheng/Desktop/IT320.pem /Users/kimchhayheng/Desktop/site.tar ec2-user@3.82.60.167:.

#to rename or moving the file to another directory or insid the same directory
mv "original file name" "new file name"

#to uncompess the file
tar -xzvf "file name"

#to remove a file
rm "file name"

#to remove a directory
rm -r "directory name"

tree #to see the directory
#example
tree -L 2 #to see the directory only 2 levels

download lynx
sudo yum install lynx
lynx soccer.html
control + c to exit

more soccer.html
#to see the file one page at a time

grep http soccer.html
#to find the word http

grep http soccer.html | grep -v "https" | wc -l
#to find the word http but not https

find . | xargs grep "http://" | wc -l

#to find the word http in all the file in the directory
find . | xargs grep "http://" 2>/dev/null | wc -l
#2>/dev/null is to hide the error

---------
#now we are compressing the file, the espn and global to new.tgz
tar -czvf new.tgz espn.co.uk global.espn.com
---------
#now talk about GPG, to encrypt the file
echo "check this out" > textfile.txt
    #this will create a file called textfile.txt

sudo dnf install --allowerasing gnupg2-full
    #this will install gpg2

gpg -c textfile.txt
#this will encrypt the file
#after you will be asked to enter the passwprase
# you now can see the textfile.txt.gpg

gpg textfile.txt.gpg
#this will decrypt the file
---------------------------

sha256sum textfile.txt
#this will show the hash of the file, you should check this is like the fingerprint of the file. 
#you can do this to check if the file is the same, exactly the same.
