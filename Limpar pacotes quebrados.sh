#!/bin/bash

#note que $1 aqui será substituído pelo Bash pelo primeiro argumento passado em linha de comando
#if ! apt-get install $1
#then
#    echo "Não foi possível instalar o pacote $1"
#    exit 1
#fi
#echo "Instalação finaliza"

echo "limpar pacotes com erros"
if ! apt-get autoclean
then
    echo "Não foi possível limpar o sistema"
    exit 1
fi
echo "limpeza concluída"

echo "limpar dependencias"
if ! apt-get autoremove
then
    echo "Não foi possível limpar o sistema"
    exit 1
fi
echo "limpeza concluída"
