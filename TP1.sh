#!/bin/bash

# Robin Bidanchon
# 2021-02-22
# Ce script permet de manipuler les utilisateurs d'un systeme linux

# Récupère la liste des utilisateurs
UsersList()
{
   usersList=`eval "cut -d: -f1 /etc/passwd"`
   echo $usersList
}

# Retourne le nombre d'utilisateurs
NumberOfUsers()
{
   nbUsersValue=`eval "cat /etc/passwd | wc -l"`
   echo "Il y a $nbUsersValue utilisateurs"
}

# Vérifie si unutilisateur peut se logger
UserCanLogin()
{
   if grep -wq ^$1 /etc/passwd; then
      if grep -w ^$1 /etc/passwd | grep -wq nologin; then
         echo "Cet utilisateur ne peut pas se connecter"
      else
         echo "Cet utilisateur peut se connecter"
      fi
   else
      echo "Cet utilisateur n'existe pas"
   fi
}

# Vérifie que le UID de l'utilisateur Root est dupliqué
RootUidDuplication()
{
   nbRootUid=`eval "cat /etc/passwd | grep ':0:' | wc -l"`
   if [ $nbRootUid -ne 1 ]; then
      echo "Il y a une duplication de l'utilisateur root (uid: 0)"
   else
      echo "Il y n'y a pas de duplication de l'utilisateur root"
   fi
}

menuVariable=10

while [ $menuVariable -ne 0 ]; do

   echo ""
   echo "Menu"
   echo "   1 : Lister les utilisateurs"
   echo "   2 : Nombre d'utilisateurs"
   echo "   3 : Un utilisateur peut se logger"
   echo "   4 : Duplication de l'utilisateur Root"
   echo "   0 : Quitter"
   read -p "Votre choix : " menuVariable

   case $menuVariable in 

      1) UsersList;;
      2) NumberOfUsers;;
      3)
         read -p "Nom de l'utilisateur : " username
         UserCanLogin $username
      ;;
      4) RootUidDuplication;;
      0) echo "Au revoir (╯°□°）╯︵ ┻━┻"; exit;;
      *) echo "Choix introuvable"; menuVariable=10;;

   esac

done
