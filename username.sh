#!/bin/bash
#Author: Ravisha Dissanayake
#Date: 08/11/2020
#Purpose: Gets the fullnames for users in a group

#path for the groups
groups_dir=/home/rdissanayake/groups.txt

#output the list of the groups ignore the last line which is a space
cat ${groups_dir} | while read line || [[ -n $line ]];
do
	#each group needs to be written so we know where the users belong to
	echo $line >> users_in_groups.txt

	#get the list of users in each group
	users="$(getent group $line | cut -d ':' -f 4-)"
	#create and array by taking each element seperated by delimineter
	IFS=',' read -ra my_list <<<"$users"

	#read the list and out put the names
	#read each username in the array and convert to fullnames 
	for names in "${my_list[@]}"
	do
		getent passwd $names |cut -d ':' -f 5 >> users_in_groups.txt
		#echo $users >> users_in_groups.txt
	done
done
