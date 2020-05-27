#!/bin/bash -x
echo "Welcome to Probablity Problem"


declare -A dict

read -p "Enter the value coin flip : " flip
read varname
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


function checkProbablity(){
	a=$1
    b=$2
    result=$(( 100 * $a / $b )) 
	echo "$result" 
}

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
