
#!/bin/bash -x

#Use case 1
DAY=0
START=100
BET=1

#Use case 2
Bet(){
	WIN=$((RANDOM % 2))
	if [ $WIN -eq 1 ]
	then
		START=$(($START + 1))	
	else
		START=$(($START - 1))
	fi
}

#Use case 3
HIGH=$(($START + $(($START / 2))))
LOW=$(($START - $(($START / 2))))
Day(){
START=100
while [ $START -lt $HIGH ] && [ $START -gt $LOW ]
do
	Bet
done
}

#Use case 4
CNT=0
Month(){
while [ $DAY -lt 20 ]
do
	Day
	ARR[$CNT]=$START
	CNT=$(($CNT + 1))
	if [ $START -eq 150 ]
	then 
		WON=$(($WON + 50))
	else
		LOST=$(($LOST + 50))
	fi
	DAY=$(($DAY + 1))
done
echo "Total won amount is $WON"
echo "Total lost amount is $LOST"
}
Month

#Use case 5
Days(){
WIN_DAY=$(($WON / $LOW))
LOST_DAY=$(($LOST / $LOW))
echo "days of won is $WIN_DAY"
echo "days of lost is $LOST_DAY"
}
Days

#Use case 6
Findday(){
for ((DAYS=0; DAYS<20; DAYS++))
do
	if [ ${ARR[$DAYS]} -eq $HIGH ]
	then
		echo "Luckist day $(($DAYS + 1))"
	else
		echo "Unluckist day $(($DAYS + 1))"
	fi
done
}
Findday

#Use case 7
while [ true ]
do
if [ $WIN_DAY -gt $LOST_DAY ]
then
	echo "You are win last month"
	echo -e "You want to continue...\n1:yes\n2:no"
	read CHOICE
	if [ $CHOICE == 'yes' ]
	then
		Month
		Days
		Findday
	else
		exit
	fi
else
	echo "You are lost last month"
	exit
fi
done
