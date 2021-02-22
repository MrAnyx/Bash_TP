#!/bin/bash

# Robin Bidanchon
# 2021-02-22
# Ce script permet de manipuler un agenda

# Création d'un nouveau rendez-vous
PrendreRDV()
{
   read -p "Date (jjmmaaaa) : " date
   read -p "Heure : " heure
   read -p "Objet : " objet
   echo "$date,$heure,$objet" >> data.txt
}

ConsulterRDV()
{
   if [ -z "cat data.txt" ]; then
      echo "Vous n'avez pas de rendez-vous"
   else
      read -p "Date (jjmmaaaa) : " date
      rendezVous=`eval "grep -w $date data.txt | wc -l"`
      if [ $rendezVous -eq 0 ]; then
         echo "Vous n'avez pas de rendez-vous ce jour-ci"
      else
         grep -w $date data.txt
      fi
   fi
}

SupprimerRDV() {
   cat data.txt
   read -p "Entrez la date des rendez-vous à supprimer (jjmmaaaa) : " dateRdv
   rendezVousDate=`eval "grep -w $dateRdv data.txt | wc -l"`
   if [ $rendezVousDate -eq 0 ]; then
      echo "Vous n'avez pas de rendez-vous ce jour-ci"
   else
      grep -v $dateRdv data.txt > data.tmp
      mv data.tmp data.txt 
   fi
}

menuVariable=10

dateJour=`date +"%d%m%Y"`

if [ $# -eq 1 ] && [ $1 = "-d" ]; then
   for i in `cut -d, -f1 data.txt`; do
      if [ $i -lt $dateJour ]; then
         grep -v $i data.txt > data.tmp
         mv data.tmp data.txt
      fi
   done
fi


while [ $menuVariable -ne 0 ]; do

   echo ""
   echo "Menu"
   echo "   1 : Prendre un rendez-vous"
   echo "   2 : Consulter les rendez-vous par date"
   echo "   3 : Supprimer un rendez-vous"
   echo "   0 : Quitter"
   read -p "Votre choix : " menuVariable

   case $menuVariable in 

      1) PrendreRDV;;
      2) ConsulterRDV;;
      3) SupprimerRDV;;
      0) echo "Au revoir (╯°□°）╯︵ ┻━┻"; exit;;
      *) echo "Choix introuvable"; menuVariable=10;;

   esac

done