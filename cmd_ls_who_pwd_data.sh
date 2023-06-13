#!bin/bash
echo "*cmd meau ** 1 - data 2 -ls 3 - who 4 - pwd"
read -p "please input a number: " n
if [ -z "$n" ]
then
	echo  "请输入一个1-4的纯数字."
	exit
fi

n1=`echo $n | sed 's/[0-9]//g'`
if [ -n "$n1" ]
then
	echo  "请输入一个1-4的纯数字."
        exit
fi
case $n in
	1)
		date
		;;
	2)
		ls
		;;
	3)
		who
		;;
	4)
		pwd
		;;
	*)
		echo "请输入1-4的数字"
		;;
esac
