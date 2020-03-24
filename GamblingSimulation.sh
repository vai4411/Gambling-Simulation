
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
month(){
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
}
month
#Use case 5
days(){
winday=$(($won / $low))
lostday=$(($lost / $low))
echo "days of won is $winday"
echo "days of lost is $lostday"
}
days

#Use case 6
findday(){
for ((i=0; i<20; i++))
do
	if [ ${arr[$i]} -eq $high ]
	then
		echo "Luckist day $(($i + 1))"
	else
		echo "Unluckist day $(($i + 1))"
	fi
done
}
findday

#Use case 7
while [ true ]
do
if [ $winday -gt $lostday ]
then
	echo "You are win last month"
	echo -e "You want to continue...\n1:yes\n2:no"
	read ch
	if [ $ch == 'yes' ]
	then
		month
		days
		findday
	else
		exit
	fi
else
	echo "You are lost last month"
	exit
fi
done
