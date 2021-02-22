#!/bin/bash

if [ -z $1 ]; then
   echo -e "\e[31mERROR \e[39m: Vous devez renseigner un utilisateur"
   exit
else
   if grep -wq ^$1 /etc/passwd; then
      echo -e "\e[32mOK \e[39m: L'utilisateur existe"
   else
      echo -e "\e[31mFAILED \e[39m: L'utilisateur n'existe pas"
   fi
fi