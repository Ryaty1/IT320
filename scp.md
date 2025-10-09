example of scp

scp -i "IT320.pem" "ec2-user@54.221.21.40:/home/ec2-user/Root.*" .
scp -i "IT320.pem" ec2-user@54.221.21.40:/home/ec2-user/Wheel.users .
scp -i "IT320.pem" ec2-user@54.221.21.40:/home/ec2-user/Student.password .


scp -i /Users/kimchhayheng/Desktop/IT320.pem /Users/kimchhayheng/Desktop/site.tar ec2-user@3.82.60.167:~
