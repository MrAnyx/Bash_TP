#!/bin/bash

a=10
while [ $a -gt 0 ]
do
echo a=$a
a=`expr $a - 1`
done



for i in 1 2 3
do
echo i=$i
done


for j in $(seq 24)
do
echo j=$j
done


for k in `ls`
do
echo k=$k
done




