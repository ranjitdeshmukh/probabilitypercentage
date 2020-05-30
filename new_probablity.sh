echo "Welcome to Probablity Problem"
declare -A dict

read -p "Enter the value coin flip : " number_flip
echo "1 Select The singlet"
echo "2 Select The Doublet"
echo "3 Select The Tripllet"

read coin_combination

for (( i = 1; i <=$number_flip; i++ )); 
do
	combination=""
	
	for (( j = 1; j <=$coin_combination; j++ )); 
	do			
		choice=$((RANDOM % 2 ))

		if [ $choice -eq "1" ]
		then
			combination=$combination"H"

		elif [ $choice -eq "0" ]
		then 
			combination=$combination"T"
		fi
	done

	dict[$combination]=$((${dict[$combination]} + 1 ))

done

for x in "${!dict[@]}"
do	
	val=${dict[$x]}
	echo "$x  $(( 100 * $val / $number_flip)) %"
done | sort -k2  -nr | head -1
