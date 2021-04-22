#!/bin/bash



#David Peña

#Per executar amb root


if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 9
fi

clear
echo -n "Nom del grup: "
read gname

if id -u "$g_name" >/dev/null 2>&1;
then 
    echo "Group UID:"
    id -g $gname
    exit 0

else 
    echo "ERROR: aquest usuari no existeix" 
    exit 1
fi
