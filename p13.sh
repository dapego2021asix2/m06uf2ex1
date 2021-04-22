#!/bin/bash



#DAVID PEÑA GOMEZ


#######COMPROVANT SI L'ARXIU DE GUIÓ L'EXECUTA L'USUARI ROOT#########
clear
if (( $EUID != 0 ))
then
    echo "Executa-ho com a root"
    exit 1
fi

regex='^[A-Z0-9a-z._%+-]+@[A-Z0-9a-z.-]+.[A-Za-z]{2,63}$'

echo -n "correu electrònic: "
read email

if [[ $email =~ $regex ]]
then
    echo $email >> /etc/blackmail.list
    
    echo 'estas a la llista negra /etc/blackmail.list'
else
    echo "Incorrecta"
    exit 5
    
    
fi
exit 0
