#!/bin/bash

# This script makes an environment for testing file manipulation on the user's desktop.

mkdir ./Testing
cd ./Testing
#  mkdir ~/Desktop/Testing
#  cd ~/Desktop/Testing
touch file1.txt
touch file2.txt
touch file3.txt
touch file4.txt
echo '1
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
error' > file1.txt
echo 'error
2
3
4
5
6
7
8
9
10
11
12
13
14
15
16
17
18
19
20
21
22
23
24
25
26
27
28
29
30
31' > file2.txt
