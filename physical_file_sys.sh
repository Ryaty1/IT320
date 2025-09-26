sudo yum install htop # Install htop for system monitoring, process management, and resource usage.
#after installing htop, you can run it by typing 'htop' in the terminal.

#on the other termoinal type which ls, which bash
which ls # Check the path of the 'ls' command
which bash

#which tell where is program is located
#you can also use whereis command.

find  # Find files and directories in the filesystem
find -name "input" # Find the location of the vim executable
find *.txt # Find all text files in the current directory and its subdirectories
ind / -type d -name "logs" # Find all directories named "logs" starting from the root directory
find /var -type f -size +100M # Find all files larger than 100MB in the /var directory


vi /usr/bin/vim # Open the vim executable file in vi editor to view its contents, open vi in vi
----
wget https://www.eggington.net/it_320/jobs.tar.gz # Download a tar.gz file from the specified URL
-----
sudo yum install wget # Install wget for downloading files from the web
sudo yum install curl # Install curl for transferring data with URLs
sudo yum install git # Install Git for version control
sudo yum install vim # Install Vim text editor
sudo yum install net-tools # Install net-tools for network management


**********************
       TEST
**********************

tar -xvzf jobs.tar.gz # Extract the contents of the jobs.tar.gz file
ls
chmod +x Job[1.5].sh # Make the Job[1.5].sh script executable, 1 and 5 .
chmod +x Job[1-5].sh # Make all Job scripts from 1 to 5 executable

./Job1.sh # Run the Job1.sh script
./Job1.sh & # Run the Job1.sh script in the background, mean you can still use terminal for other tasks. to kill it you can do fg (foreground) and then ctrl+c.
fg = forground, ctrl+c = to stop the process.

/Job1.sh > log1.txt & # Run the Job1.sh script in the background and redirect its output to log1.txt, so you can check the output in the log1.txt file and it keep running. 
---
EXAM!!!!

ps -eaf | grep [h]top # it will show the process ID. (PID) of htop if it is running.
kill <PID> # Replace <PID> with the actual process ID of htop to terminate it.

grep # is used to change the output of a command or search for a specific pattern in a file.

 ls; which bash; find. | grep bash # List files in the current directory, find the path of bash, and search for "bash" in the output.

 mkdir -p mkdir -p a/b/c/d/e/f # Create nested directories a/b/c/d/e/f, -p = parent directory. creating f in e, e in d, d in c, c in b, b in a.
 mkdir -p {0..50} # Create directories named 0 to 50 using brace expansion. creat 1-50 in one directory.