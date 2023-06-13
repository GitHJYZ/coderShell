#!bin/bash
sum=0
for men in `ps aux|grep -v 'RSS'|awk '{print $6}'`
do
   sum=$[$sum+$men]
done
echo "(ps)The total memory is $sum""k"
