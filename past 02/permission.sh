mkdir Permissions
cd Permissions
ls -ltrah
mkdir tmp     
touch 1
ls -l
ln -s tmp temp # Create a symbolic link
ls -l
chmod o-rwx tmp # Remove all permissions for others
ls -l
chmod g=rwx 1 # Set read, write, execute for group

chown root 1 # Change owner to root (may require sudo)
sudo !! # Re-run the last command with sudo

sudo chown ec2-user:root 1 # Change owner to ec2-user:root
sudo su - # Switch to root user

 tail /etc/group

groupadd stooge
useradd -g stooge larry
useradd -g stooge curly
useradd -g stooge moe
mkdir shared

chown root:stooge shared # Set owner to root:stooge for shared directory
pwd     # Print working directory
mkdir {1..4} # Create directories 1 to 4
touch larry curly moe # Create files larry, curly, moe

chown larry:root 1
chown curly:root 2
chown moe:root 3

chown root:stooge 4    # Set owner to root:stooge for directory 4

chmod g-x 1 2 3 # Remove execute permission for group on files 1, 2, 3
chmod o-rx 1 2 3 # Remove read and execute for others on files 1, 2, 3
---

umask # Set umask to 002
umask -S # Print umask in symbolic form
ls
touch 1
mkdir 2
ls -l


umask u=rwx,g=,o= # Set umask to u=rwx,g=,o=
unask -S        


exit 
cd 
less .bashrc

sudo less /etc/bashrc

mkdir sticky
cd sticky

----
chmod +x script.sh # Make the script executable

---
chattr +i 1 # Make file 1 immutable, but you can still modify it
chattr -i 1 # Remove immutable attribute from file 1
lsattr 1     # List attributes of file 1, this mean that the file is immutable now and cannot be modified.