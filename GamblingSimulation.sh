#!/bin/bash -x

#Use case 1
day=1
start=100
bet=1

#Use case 2
bet(){
r=$((RANDOM % 2))
if [ $r -eq 1 ]
then
	start=$(($start + 1))
else
	start=$(($start - 1))
fi
}

#Use case 3
high=$(($start + $(($start / 2))))
low=$(($start - $(($start / 2))))
while [ $start -lt $high ] && [ $start -gt $low ]
do
	bet
done
