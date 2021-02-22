#!/bin/bash

displayChoix()
{
   echo "Choix $1 selectionné"
}

menuVariable=10

while [ $menuVariable -ne 0 ]; do

   echo ""
   echo -e "\e[32mMenu \e[39m"
   echo -e "   1 : \e[32mChoix 1 \e[39m"
   echo -e "   2 : \e[32mChoix 2 \e[39m"
   echo -e "   3 : \e[32mChoix 3 \e[39m"
   echo -e "   4 : \e[32mChoix 4 \e[39m"
   echo -e "   0 : \e[32mQuitter \e[39m"
   read -p "Votre choix : " menuVariable

   case $menuVariable in 

      1|2|3|4) displayChoix $menuVariable;;
      0) echo "Au revoir (╯°□°）╯︵ ┻━┻"; exit;;
      *) echo "Choix introuvable"; menuVariable=10;;

   esac

done
