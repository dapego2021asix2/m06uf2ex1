
#!/bin/bash

#DAVID PEÑA GOMEZ


#######COMPROVANT SI L'ARXIU DE GUIÓ L'EXECUTA L'USUARI ROOT###################


if (( EUID != 0 ))
then
  echo "Aquest script s'ha d'executar amb prilegis de l'usuari root"
  exit 9
fi


echo -n "Escriu la carpeta a crear dentro de /var:"
read dir


if [ -d /var/$dir ]
then
    cp /etc/sshd/sshd_config /var/$dir
    cp /etc/cups/cupsd.conf /var/$dir
    echo "Fitxers copiats"

else
    mkdir /var/$dir
    cp /etc/sshd/sshd_config /var/$dir
    cp /etc/cups/cupsd.conf /var/$dir
    echo "Fitxers copiats"

fi

echo -n "Vols continuar? SI [y] | NO [n]: "
read opt

if  [[  $opt  ==  "y"  ]]
then
    ( exec "./p2.sh" )
else
    exit 5
fi
