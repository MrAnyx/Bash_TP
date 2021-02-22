#!/bin/bash

# Si pas de paramètre
if [ -z $1 ]; then
   echo -e "\e[31mERROR \e[39m: Vous devez renseigner un flag"
   exit

# Si plus de 4 paramètres
elif [ ! -z $5 ]; then
   echo -e "\e[31mERROR \e[39m: Vous devez renseigner au plus 4 flags"
   exit
fi

# if [ $# -lt 1 ]; then
#    echo -e "\e[31mERROR \e[39m: Vous devez renseigner un flag"
#    exit
# elif [ $# -gt 4 ]; then
#    echo -e "\e[31mERROR \e[39m: Vous devez renseigner au plus 4 flags"
#    exit
# fi

for arg in $*; do
   case $arg in
      "-a"|"-b"|"-c"|"-d");;
      *) echo "\e[31mInvalid flag\e[39m"; exit;;
   esac
done


for arg in $*; do
   case $arg in
      -a) echo "Flag a";;
      -b) echo "Flag b";;
      -c) echo "Flag c";;
      -d) echo "Flag d";;
   esac
done