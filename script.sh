#!/bin/bash

a=1
if [ $a -eq 1 ]; then
echo a=1
else
echo a!=1
fi


a=1
if [ $a -eq 1 ]
then
echo a=1
else
echo a!=1
fi


if [ -s toto ]
then
echo "Le fichier toto existe"
else
echo "le fichier n'existe pas"
fi


if test -s toto
then
echo "existe"
else
echo "n'existe pas"
fi


