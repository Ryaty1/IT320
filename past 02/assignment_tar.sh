echo "This is my first file" > file1.txt
echo "This is my second file" > file2.txt
echo "This is my third file" > file3.txt

ls -l

tar -czvf kimchhay.tgz file1.txt file2.txt file3.txt

ls -lh kimchhay.tgz

tar -xzvf kimchhay.tgz

---
#on your local machine:
scp -i /Users/kimchhayheng/Desktop/IT320.pem ec2-user@54.226.98.22:/home/ec2-user/kimchhay.tgz /Users/kimchhayheng/Desktop



# Note: change your name, and the pathe and your ec2 ip address