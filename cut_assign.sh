mkdir playing
   20  cd playing
   21  clear
   22  for letter in {A..Z}; do echo ${letter} >> letter.txt; done
   23  cat letter.txt 
   24  wc -l letter.txt 
   25  export x=0
   26  while
   27  while [ $x -le 25 ]; do echo "$x" >> number.txt; ((x++)); done
   28  cat number.txt 
   29  wc -l number.txt 
   30  wc -l *
   31  cat letter.txt number.txt
   32  cat *
   33  paste letter.txt number.txt 
   34  paste number.txt letter.txt letter.txt letter.txt letter.txt number.txt 
   35  paste -s number.txt letter.txt letter.txt letter.txt letter.txt number.txt 
   36  clear
   37  sudo find /etc -exec egrep -H [P,p][A,a][S,s]{2} {}\;
   38  sudo find /etc -exec egrep -H [P,p][A,a][S,s]{2} {} \;
   39  sudo find /etc -exec egrep -H [P,p][A,a][S,s]{2} {} \; 2> /dev/null
   40  sudo find /etc -exec egrep -H [P,p][A,a][S,s]{2}[W,w] {} \; 2> /dev/null
   41  sudo find /etc -exec egrep -H [P,p][A,a][S,s]{2}[W,w] {} \; 2> /dev/null | cut -f1 -d: 
   42  sudo find /etc -exec egrep -H [P,p][A,a][S,s]{2}[W,w] {} \; 2> /dev/null | cut -f1 -d: | sort 
   43  sudo find /etc -exec egrep -H [P,p][A,a][S,s]{2}[W,w] {} \; 2> /dev/null | cut -f1 -d: | sort | uniq
   44  sudo find /etc -exec egrep -H [P,p][A,a][S,s]{2}[W,w] {} \; 2> /dev/null | cut -f1 -d: | sort | uniq | wc -l
   45  sudo find /etc -exec egrep -H [P,p][A,a][S,s]{2}[W,w] {} \; 2> /dev/null | cut -f1 -d: | sort | wc -l
   46  vi cut_paste_sort_egrep.sh
   47  \. cut_paste_sort_egrep.sh 
   48  vi cut_paste_sort_egrep_wc.sh
   49  \. cut_paste_sort_egrep_wc.sh 
   50  vi cut_paste_sort_egrep_wc_uniq.sh
   51  \. cut_paste_sort_egrep_wc_uniq.sh 
   ------






Question 1: Which users have the most processes right now? 
Command: ps -eo user --no-headers | sort | uniq -c | sort -nr | head


Question 2: Which processes have been running the longest? 
Command: ps -eo user,etime,comm --no-headers | sort -k2r | head


Question 3: What started most recently by user? 
Command: ps -eo user,stime,comm --no-headers | sort -k2 





