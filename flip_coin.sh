#!/bin/bash
declare -A dict2
dict2=(["HH"]=0 ["TT"]=0 ["TH"]=0 ["HT"]=0)
read -p "Number of times to flip the coin" num
for (( i=1;i<=$num;i++ ))
do
	key1=""
	for(( j=1;j<=2;j++ ))
	do
		flip1=$(( RANDOM%2 ))
		if [ $flip1 -eq 0 ]
		then
			key1=$key1"T"
		else
			key1=$key1"H"
		fi
	done
        dict2[$key1]=$(( ${dict2[$key1]}+1 ))
done
for index in  ${!dict2[@]}
do
        echo "Number of times $index appears is "${dict2[$index]}
        percent=`echo ${dict2[$index]} $num | awk '{print $1/$2}'`
        percentile=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentile
done


