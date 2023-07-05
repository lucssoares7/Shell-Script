#!/bin/bash

#note que $1 aqui será substituído pelo Bash pelo primeiro argumento passado em linha de comando
#if ! apt-get install $1
#then
#    echo "Não foi possível instalar o pacote $1"
#    exit 1
#fi
#echo "Instalação finalizada"

echo "instalar pacotes uteis"
if ! apt-get install kde-l10n-ptbr artha p7zip-rar curl wget apt-transport-https dirmngr
then
    echo "Não foi possível instalar o pacote $1"
    #exit 1
fi
echo "Instalação finalizada"

