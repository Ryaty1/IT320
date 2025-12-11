#!/bin/bash
sudo netstat -nlptu | grep LISTEN | tr -s " " | cut -d " " -f 7 | cut -d "/" -f2 | sort | uniq | tr '\r\n' ' ' | tr -s ' '
