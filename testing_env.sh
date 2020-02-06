#!/bin/bash
#This script makes an environment for testing file manipulation on the user's desktop.

ev=~/Testing
mkdir $ev && cd $ev

for i in {1..29..1};do
    echo $i >> file1.txt
  done
echo error >> file1.txt

echo error >> file2.txt
for i in {2..30..1};do
    echo $i >> file2.txt
  done

touch file3.txt file4.txt
