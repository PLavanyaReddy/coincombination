#!/bin/bash
declare -A dict
dict=(["H"]=0 ["T"]=0)
declare -A dict2
dict2=(["HH"]=0 ["TT"]=0 ["TH"]=0 ["HT"]=0)
declare -A dict3
dict3=(["TTT"]=0 ["TTH"]=0 ["THT"]=0 ["THH"]=0 ["HTT"]=0 ["HTH"]=0 ["HHT"]=0 ["HHH"]=0)
read -p "Number of times to flip the coin" num
for (( i=1;i<=$num;i++ ))
do
	flip=$(( RANDOM%2 ))
        if [ $flip -eq 0 ]
        then
                key="T"
        else
                key="H"
        fi
        dict[$key]=$(( ${dict[$key]}+1 ))
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
	key2=""
        for(( j=1;j<=3;j++ ))
        do
                flip2=$(( RANDOM%2 ))
                if [ $flip2 -eq 0 ]
                then
                        key2=$key2"T"
                else
                        key2=$key2"H"
                fi
        done
        dict3[$key2]=$(( ${dict3[$key2]}+1 ))

done
max1=0
echo "Singlet combination:"
for index in  ${!dict[@]}
do
        echo "Number of times $index appears is "${dict[$index]}
        percent=`echo ${dict[$index]} $num | awk '{print $1/$2}'`
        percentile=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentile
	if [ $max1 -eq 0 ]
	then
		max1=${dict[$index]}
		combination=$index
	elif [ ${dict[$index]} -gt $max1 ]
	then
		 max1=${dict[$index]}
		combination=$index
	fi
done
echo "Doublet combination:"
for index in  ${!dict2[@]}
do
        echo "Number of times $index appears is "${dict2[$index]}
        percent=`echo ${dict2[$index]} $num | awk '{print $1/$2}'`
        percentile=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentile
	if [ ${dict2[$index]} -gt $max1 ]
        then
                max1=${dict2[$index]}
                combination=$index
        fi
done
echo "Triplet combination:"
for index in  ${!dict3[@]}
do
        echo "Number of times $index appears is "${dict3[$index]}
        percent=`echo ${dict3[$index]} $num | awk '{print $1/$2}'`
        percentile=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentile
	if [ ${dict3[$index]} -gt $max1 ]
        then
                max1=${dict3[$index]}
                combination=$index
        fi
done
echo "The winning combination is "$combination

