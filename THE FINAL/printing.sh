systemctl status cups # Check the status of the CUPS printing service
sudo yum install cups # Install CUPS on a system using yum package manager
sudo systemctl start cups # Start the CUPS service
lpstat -p -d # Show the default printer
lpstat -o # List all print jobs
curl http://localhost:631/ # Access the CUPS web interface
sudo yum install hplip # Install HP Linux Imaging and Printing drivers
sudo yum install lynx # Install the Lynx text-based web browser
lynx http://localhost:631/ # Open the CUPS web interface in Lynx

----------------------------------------------------------------

ifconfig -a # Display all network interfaces and their configurations
lynx 127.0.0.1:631 # Open the CUPS web interface in Lynx, same as localhost, 127.0.0.1 is the loopback address

#go to whatismyip.com and check your public IP
lynx whatismyip.com # Open whatismyip.com in Lynx to check

#on aws search access instance metadata and open the Access instance metadata for an EC2 instance - Amazon Elastic Compute Cloud (Amazon EC2) is a web service that provides resizable computing capacity in the cloud. EC2 is a web service that provides resizable computing capacity in the cloud.
#click the Dybamic data 
TOKEN=`curl -X PUT "http://169.254.169.254/latest/api/token" -H "X-aws-ec2-metadata-token-ttl-seconds: 21600"` \
&& curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/dynamic/instance-identity/ #this will give you the instance id, region, and other information about your instance

curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/ #this will give you all the metadata about your instance
curl -H "X-aws-ec2-metadata-token: $TOKEN" http://169.254.169.254/latest/meta-data/public-ipv4 #like asking is this still my public ip address? it will give you your public ip
traceroute www.amazon.com #trace the route to amazon.com
sudo lsof -i -n -P #list open files and network connections, in simple words what files are being used by what process
sudo lsof -i established #list established network connections
sudo tcpdump #capture network packets, you can specify interface and other options
for number in {1..9999}; do echo I can count to ${RANDOM} >> random.txt; sleep 5; done & #this will create a file named random.txt and will write 9999 lines to it, sleep command will wait for 5 seconds before creating the next line
htop #interactive process viewer, shows system resource usage and running processes
kill -7 <number> #this will kill the process
kill -9 <number> #this will kill the process immediately