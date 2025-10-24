mkdir copy_paste_sort
cd copy_paste_sort/
echo "cat"
echo -e "cat\ndog"
echo -e "Name,Age,City\nAlice,22,Paris\nBob,19,Tokyo\nCharlie,25,London"
echo -e "Name,Age,City\nAlice,22,Paris\nBob,19,Tokyo\nCharlie,25,London" > data.txt
cat data.txt
column -s',' -t data.txt 
cut -d',' -f1 data.txt 
cut -d',' -f1 data.txt > names.txt
cat names.txt 
echo -e "Grade\nA\nB\nC" > grades.txt
cat grade.txt
cat grades.txt 
paste -d',' data.txt grades.txt | column -s"," -t
ls data.txt grades.txt names.txt 
mv grades.txt 
mv grades grades.txt 
ls data.txt grades.txt names.txt 
paste -d',' data.txt grades.txt
paste -d',' data.txt grades.txt | column -s"," -t
cat grades.txt 
ls data.txt grades.txt names.txt 
paste -d',' data.txt grades.txt | sort -n
paste -d',' data.txt grades.txt > merged.txt
cat merged.txt 
column -s"," -t merged.txt
last | grep -v ^reboot
last | grep -v ^reboot | tr -s ' '
last | grep -v ^reboot | tr -s ' ' | cut -d " " -f 1
last | grep -v ^reboot | tr -s ' ' | cut -d " " -f 1 | sort -n
last | grep -v ^reboot | tr -s ' ' | cut -d " " -f 1 | sort -n | uniq
vi cool_name.sh #in there we paste last | grep -v ^reboot | tr -s ' ' | cut -d " " -f 1 | sort -n | uniq
chmod +x cool_name.sh
ls
./cool_name.sh 
bash cool_name.sh