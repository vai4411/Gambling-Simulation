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

