#!/bin/bash

#note que $1 aqui será substituído pelo Bash pelo primeiro argumento passado em linha de comando
#if ! apt-get install $1
#then
#    echo "Não foi possível instalar o pacote $1"
#    exit 1
#fi
#echo "Instalação finalizada"


echo "instalar programas de desenvolvimento"
if ! apt-get install geany gedit gpt gcc scratch kturtle 
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"
