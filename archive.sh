#!/bin/bash
#Author: Ravisha Dissanayake
#Date: 06/14/2019
#Purpose of this script is to scan and archive a list of the directories in /dicom/data within a specific time frame

#List of all the directories to scan 
#dirlist ="/dicom/data/A* /dicom/data/B* /dicom/data/C*"

#shopt -s nullglop
for d in $(ls /dicom/data/A* /dicom/data/B* /dicom/data/C*);
do
	find "$d" -maxdepth 4 -type d -newermt 2016-01-01 ! - newermt 2016-12-31
	echo $d 
done > /home/rdissanayake/listAC.txt




