#/bin/bash
if [[ $EUID -ne 0 ]]; then
        echo Run as root;
        exit 1;
fi
file="/home/ec2-user/grade.txt"
touch $file
: > $file

grade=0


users=(china japan thailand hongkong asia)
pcc=`cat /etc/group | grep -m 1 -o "pcc"`

if [ "$pcc" = "pcc" ]; then
	echo "Good, made pcc group" | tee -a $file
	grade=$(($grade+5))
	echo "Score: $grade / 5" | tee -a $file
	flag=true
	for a in ${users[@]}; do
		member=`su -c groups $a - | grep -o -i pcc`	
		if [[ $member != "pcc" ]]; then
			flag=false
			echo "Add $a to the pcc group" | tee -a $file
		elif [[ "$a" =~ ^(china|japan|thailand|hongkong|asia)$ ]]; then
			grade=$(($grade+2))
			echo "Good, you added $a to the pcc group"
		else
			
			echo "Add $a to the pcc group"
		fi
			
	done
	if [ "$flag" = "true" ]; then
		echo "Good, all the users are added to the pcc group" | tee -a $file
	fi
else
	echo "Create a group called \"pcc\" and add the users to it" | tee -a $file
fi

echo "Score: $grade / 15" | tee -a $file

profile=`cat /etc/profile | grep -m 1 -o "037"`
uflag=true

for a in ${users[@]}; do
	usermask=`su -c "umask" - $a | grep -m 1 -o "037"`
	if [[ $usermask -eq "037" ]]; then
		if [[ "$a" =~ ^(china|japan|thailand|hongkong|asia)$ ]]; then
			grade=$(($grade+2))
		fi
	else
		uflag=false
		echo "Set umask for $a" | tee -a $file
	fi
done

if [ "$uflag" = "true" ]; then
	echo "Good, you set the umask for every user" | tee -a $file
fi

echo "Score: $grade / 25" | tee -a $file

if [ -e "/home/asia/.ssh/id_rsa" ]; then
	echo "Good, you made ssh keys for user \"asia\"" | tee -a $file
	grade=$(($grade+5))
else
	echo "Make ssh keys for user \"asia\"" | tee -a $file
fi

echo "Score: $grade / 30" | tee -a $file

login=$(journalctl | grep -m 1 -i "session opened for user asia")
if [[ -n $login ]]; then
    echo "Good, user asia is able to log in" | tee -a $file
    grade=$(($grade + 5))
else
    echo "Test login for asia user" | tee -a $file
fi

echo "Score: $grade / 35" | tee -a $file

sharelink="/home/asia/share"
symlink=`readlink $sharelink`
if [ -e "/home/shared/" ]; then
	if [ -e "$sharelink" ]; then
		if [ $symlink = "/home/shared"* ]; then
			echo "Good, you made the symlinks in the home folders" | tee -a $file
			grade=$(($grade+10))
		else
			echo "Make the symlinks to the shared folder (hint: make sure the symlinks are called \"share\")" | tee -a $file
		fi
	else
		echo "Make the symlinks to the shared folder (hint: make sure the symlinks are called \"share\")" | tee -a $file
	fi
else
	echo "Make the shared directory (hint: make it in the /home directory" | tee -a $file
fi

echo "Score: $grade / 45"


sharegroup=`ls -l /home | grep shared | tr -s ' ' | cut -d ' ' -f 4`
if [ "$sharegroup" = "pcc" ]; then
	echo "Good, the group on the shared folder is correct" | tee -a $file
	grade=$(($grade+10))
else
	echo "Change the group on the shared folder to pcc" | tee -a $file
fi

echo "Score: $grade / 55" | tee -a $file

shareperm=`stat -c "%a" /home/shared`
if [[ $shareperm == *"770"* ]] || [[ $shareperm == *"70" ]]; then
	echo "Good, you set permissions properly on the shared folder" | tee -a $file
	grade=$(($grade+5))
else
	echo "Set proper permissions on the shared folder" | tee -a $file
fi

echo "Score: $grade / 60" | tee -a $file

if [[ $shareperm = *"1"* ]]; then
        echo "Good, you set the sticky bit on the shared folder" | tee -a $file
        grade=$(($grade+5))
else
        echo "Make sure you set the sticky bit on the shared folder" | tee -a $file
fi

echo "Score: $grade / 65"

if [ -e "/home/shared/count.sh" ]; then
	ten=`sh /home/shared/count.sh | grep -o "100"`
	if [ "$ten" = "100" ]; then
		echo "Good, you made a script that can count to 100" | tee -a $file
		grade=$(($grade+15))
		f=/home/shared/count.sh
		if [[ -x "$f" ]]
		then
        		grade=$(($grade+5))
		else
        		echo "BUT, the script is not executable."
		fi
	else
		echo "Your count.sh script doesn't count to 100" | tee -a $file
	fi
else
	echo "Make a script in the shared directory that can count to 100 (hint: call it count.sh)" | tee -a $file
fi


echo "Score: $grade / 85" | tee -a $file
echo
echo "You will receive the last 15 points by making a tar file of your /home directory and uploading it to canvas (10 pts) and taking a screenshot of this output and uploading it to canvas (5 pts)" | tee -a $file

echo
echo "If you think a mistake was made in the grading, take a picture of what you think you did right and upload it to canvas with an explanation"
echo
echo "These results are saved in a file called \"grade.txt\" in your home directory: /home/ec2-user/grade.txt"
echo "You can use \"cat /home/ec2-user/grade.txt\" to review it."
echo
echo "PCC group from /etc/group" >> $file
echo `cat /etc/group | grep pcc` >> $file
echo "Log from journalctl (last 50 entries for SSH)" >> $file
echo `journalctl -u sshd -n 50` >> $file

