Final Instructions
All files should be in the ec2-users home directory. Points for the commands will be based on completeness and efficiency. If you use 5 commands for what you could do with only one, you may get docked points. 

DIRECTIONS: 
Log into your personal AWS EC2 instance (YOU MUST DO THIS PART. If you cannot do this part, you cannot do the test).
Grab the instructions from https://js-it320-420-files.s3-us-west-2.amazonaws.com/320final/test/FinalInstructions.txt using curl or wget. If you don't do this, you can't do the test.
We recommend reading all the way through the instructions before you begin.

Instructions from s3 bucket:
Run the setup.sh script to set up the test. Note: after running, it will delete its self.
  wget https://js-it320-420-files.s3-us-west-2.amazonaws.com/320final/test/setupFinal.sh; chmod u+x setupFinal.sh; sudo ./setupFinal.sh  
Install the Common Unix Printing System (10/10)(If installed previously, you may need to remove and reinstall it.
Find and kill the following processes:
  One that is sleeping for 6000 seconds (10/10)
  One that is stuck in a for loop reading a file (10/10)
  The web server associated with the Common Unix Printing System (10/10)
Install apache and create a webpage, index.html, that contains your username. Make sure apache is set to autoboot and is running. (10/10) - Hint: You will likely have to become root to do this as a simple sudo will not work. Make sure to exit root once you are done.
On your own EC2 instance, write a web check script called finalCheck.sh that: (This will be on their own system but should be treated as a remote system)(0/140)
  Checks if your cups server is up (localhost:631) similar to the Assignment - Webserver. Make sure it is a 200 success and that there is a specific phrase on the page. A good example of a command that would check is grep \<H1\>CUPS index.html.Your script should do each of the following:
    If the server is down:
      Check if the OS server is up (Single Ping)
      If the server is down, echo "Need to boot server"
    If the server is booted, but the webcheck fails:
      Use a remote command to restart the cups system.
    When you are finished, upload the script to canvas to have it graded.
Create users wisemen, stable, and star. Assign them to the group holy. (10/10)
  The wisemen need help with ssh. Create ssh keys for the wisemen and validate that the keys work by logging in as the wisemen with the new keys you have installed. PLEASE DO NOT OVERWRITE EC2-USERS AUTHORIZED_KEYS!!!
  Now create a shared folder in the /home directory called manger and give the wisemen, stable, and star access to it.
  Set the sticky bit on the folder called manger.
Write a script called finalConnect.sh to list all of the unique programs on the system that are listening for work, also known as server processes. A starting point would be netstat -nlptu. You should end up with a sorted list of programs, without duplicates, that you not only display but put in a file called finalPrograms that has one program name listed per line and nothing else. (10/20/10)
  Example
    cupsd
    sshd
Save the output of traceroute www.byuh.edu to a file called finalTrace. Sort the output of the traceroute by the "ms" taken for each hop so you can see where the longest delays exist. (10/10)
  Hint: All you need to do is sort the 4th column numerically. Look it up, as this is an option we have not done, but you have been taught how to figure this out.

The Final AutoGrader can be found at https://js-it320-420-files.s3-us-west-2.amazonaws.com/320final/test/FinalGrader.sh 