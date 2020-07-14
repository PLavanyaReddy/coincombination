#!/bin/bash
declare -A dict
dict=(["H"]=0 ["T"]=0)
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
done
for index in  ${!dict[@]}
do
        echo "Number of times $index appears is "${dict[$index]}
        percent=`echo ${dict[$index]} $num | awk '{print $1/$2}'`
        percentile=`echo $percent 100 | awk '{print $1*$2}'`
        echo "The percentage of $index is "$percentile
done

