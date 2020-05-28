#!/bin/bash -x
echo "Welcome to Probablity Problem"

declare -A dict

read -p "Enter the value coin flip : " flip
echo "1 Select The singlet"
echo "2 Select The Doublet"
read select_number
read varname


function checkProbablity() {
	a=$1
	b=$2
	result=$(( 100 * $a / $b )) 
	echo "$result" 
}

function checkVarSinglet(){

if [[ $varname -eq "H" ]]; 
then
	a=$head
	b=$flip
	new=$( checkProbablity $a $b )	
	echo "$new%"
elif [[ $varname -eq "T" ]] 
	then
		a=$head
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"
fi
}


function checkVarDobulet() {
if [[ $varname -eq "HH" ]]; 
then
	a=$head_head
	b=$flip
	new=$( checkProbablity $a $b )	
	echo "$new%"
elif [[ $varname -eq "HT" ]] 
	then
		a=$head_tail
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"
elif [[ $varname -eq "TH" ]] 
	then
		a=$tail_head
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"
elif [[ $varname -eq "TT" ]] 
	then
		a=$tail_tail
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"	    
fi
}



function singlet() {

	for (( i = 0; i <$flip; i++ )); 
	do
	    choice=$((RANDOM % 2 ))

		if [ $choice -eq "1" ]
		then
			head=`expr $head + 1`

		elif [ $choice -eq "0" ]
			then 
				tail=`expr $tail + 1`
			fi
		done

		dict+=([Key1]=$head [Key2]=$tail)

	checkVarSinglet

}

function doublet() {

	for (( i = 0; i <$flip; i++ )); 
	do
		choice=$((RANDOM % 4 ))
		if [ $choice -eq "0" ]
		then
			head_head=`expr $head_head + 1`

		elif [ $choice -eq "1" ]
		then 
			head_tail=`expr $head_tail + 1`

		elif [ $choice -eq "2" ]
		then 
			tail_head=`expr $tail_head + 1`

		elif [ $choice -eq "3" ]
		then 
			tail_tail=`expr $tail_tail + 1`

		fi
	done

	dict+=([Key1]=$head_head [Key2]=$head_tail [Key3]=$tail_head [Key4]=$tail_tail )

    	 checkVarDobulet 
}


if [[ "$select_number" -eq 1 ]]; 
   then
	    $(singlet)
	    exit
elif [[ "$select_number" -eq 2 ]]; 
	then
		 doublet
fi
