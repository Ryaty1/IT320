#to update for app to the latest
sudo yum update
sudo yum upgrade

#add a new user to our system
useradd Billy
sudo !!
#it will add the sudo before the previous command, so you don't have to type it all again. so it will run the sudo useradd Billy

--- 
# go to home by cd .. to see how many user are there
cd ..
ls
#to see the 
cat /etc/passwd

#to
cat /etc/shadow
sudo !!

#New passwd
sudo passwd Billy
---
install pwgen to get a passwd
sudo yum install pwgen
---
cat /etc/shadow
sudo !!
---
#go to root of linux
cd /
ls


cd etc
ls
#to see more of the file information
ls -ltrah 

#want to see if the word Billy in the file
grep Billy /etc/group
grep Billy /etc/shadow
sudo !!
