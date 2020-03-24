
#!/bin/bash -x

#Use case 1
day=0
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
day(){
start=100
while [ $start -lt $high ] && [ $start -gt $low ]
do
	bet
done
}

#Use case 4
cnt=0
while [ $day -lt 20 ]
do
	day
	arr[$cnt]=$start
	cnt=$(($cnt + 1))
	if [ $start -eq 150 ]
	then 
		won=$(($won + 50))
	else
		lost=$(($lost + 50))
	fi
	day=$(($day + 1))
done
echo "Total won amount is $won"
echo "Total lost amount is $lost"

#Use case 5
winday=$(($won / $low))
lostday=$(($lost / $low))
echo "days of won is $winday"
echo "days of lost is $lostday"

#Use case 6
for ((i=0; i<20; i++))
do
	if [ ${arr[$i]} -eq $high ]
	then
		echo "Luckist day $i"
	else
		echo "Unluckist day $i"
	fi
done
