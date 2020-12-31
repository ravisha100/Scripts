#!/bin/bash

#when taking the input of the folder go through the content folder at a time and upload 
#to box, wait 1hr and continute to copy till the folders are completed. 

#Accept the directory of the files
dir_path=${@}
echo "Directories transfered ${@}"

#list the subdirectories of the parent directory
LIST_OF_DIR=$(ls "${@}")
echo "${LIST_OF_DIR}"

#check if the subdirectories are less than 100GB
for FILES in "${LIST_OF_DIR}"
do 
	SIZE_DIR=$(du -sh "${FILES}" | awk '{ print $1 }')
	if [[ "${SIZE_DIR}" -gt 150G ]]
	then 
		echo "${FILES} size greater than 150GB"
		exit 1
	else 
		cp -vr "${FILES}" /Users/ravisha/Desktop/test12
	fi
	sleep 3s
done 
exit 0

#upload each directory, wait 5 hr in between each upload

