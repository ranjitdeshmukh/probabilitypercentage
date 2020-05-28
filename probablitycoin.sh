
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


function checkVartriplet() {
if [[ $varname -eq "HHH" ]]; 
then
	a=$head_head_head
	b=$flip
	new=$( checkProbablity $a $b )	
	echo "$new%"
elif [[ $varname -eq "HHT" ]] 
	then
		a=$head_head_tail
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"
elif [[ $varname -eq "HTH" ]] 
	then
		a=$head_tail_head
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"
elif [[ $varname -eq "THH" ]] 
	then
		a=$tail_head_head
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"
elif [[ $varname -eq "TTH" ]] 
	then
		a=$tail_tail_head
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"
elif [[ $varname -eq "THT" ]] 
	then
		a=$tail_head_tail
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"
elif [[ $varname -eq "TTH" ]] 
	then
		a=$tail_tail_head
		b=$flip
		new=$( checkProbablity $a $b )	
	    echo "$new%"
elif [[ $varname -eq "TTT" ]] 
	then
		a=$tail_tail_tail
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


function tripllet() {

	for (( i = 0; i <$flip; i++ )); 
	do
		choice=$((RANDOM % 8 ))
		if [ $choice -eq "0" ]
		then
			head_head_head=`expr $head_head_head + 1`

		elif [ $choice -eq "1" ]
		then 
			head_head_tail=`expr $head_head_tail + 1`

		elif [ $choice -eq "2" ]
		then 
			head_tail_head=`expr $head_tail_head + 1`

		elif [ $choice -eq "3" ]
		then 
			tail_head_head=`expr $tail_head_head + 1`
		elif [ $choice -eq "1" ]
		then 
			tail_tail_head=`expr $tail_tail_head + 1`

		elif [ $choice -eq "2" ]
		then 
			tail_head_tail=`expr $tail_head_tail + 1`

		elif [ $choice -eq "3" ]
		then 
			head_tail_tail=`expr $head_tail_tail + 1`
		elif [ $choice -eq "3" ]
		then 
			tail_tail_tail=`expr $tail_tail_tail + 1`

		fi
	done
	dict+=([Key1]=$head_head_head [Key2]=$head_head_tail [Key3]=$head_tail_head [Key4]=$tail_head_head 
		   [Key5]=$tail_tail_head [Key6]=$tail_head_tail [Key7]=$head_tail_tail [Key8]=$tail_tail_tail )

	 checkVartriplet
}

if [[ "$select_number" -eq 1 ]]; 
   then
	    singlet

elif [[ "$select_number" -eq 2 ]]; 
	then
		 doublet
elif [[ "$select_number" -eq 3 ]]; 
	then
		tripllet
fi






