echo "Welcome to Probablity Problem"


choice=$((RANDOM % 2 ))

if [ $choice -eq "1" ]
then
	echo "Heads"
else 
	echo "tail"
fi