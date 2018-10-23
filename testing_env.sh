#!/bin/bash

# This script makes an environment for testing file manipulation on the user's desktop.

mkdir ~/Desktop/Testing
cd ~/Desktop/Testing
touch file1.txt
touch file2.txt
touch file3.txt
touch file4.txt
echo 'error' >> file1.txt
