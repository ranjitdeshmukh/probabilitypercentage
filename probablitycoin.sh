#!/bin/bash -x
echo "Welcome to Probablity Problem"

declare -A dict

read -p "Enter the value coin flip : " flip
echo "1 Select The singlet"
echo "2 Select The Doublet"
echo "3 Select The Tripllet"
read select_number
read varname

function checkProbablity() {
	a=$1
	b=$2
	result=$(( 100 * $a / $b )) 
	echo "$result" 
}

	for (( i = 1; i <=$flip; i++ )); 
	do
		com=""
		for (( j = 1; j <=$select_number; j++ )); 
		do			
	    choice=$((RANDOM % 2 ))
		if [ $choice -eq "1" ]
		then
			com=$com+"H"

		elif [ $choice -eq "0" ]
			then 
				com=$com+"T"
			fi
		done
		dict[$com]=$((${dict[$com]} + 1 ))
	done

for x in "${!dict[@]}"
do	
	if [[ $varname -eq $x ]];
	 then
	 			val=${dict[$x]}
	 fi 
done

new_result=$( checkProbablity $val $flip )	
echo "$new_result %" 
