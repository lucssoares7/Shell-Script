#!/bin/bash

echo "instalar somente Latex em portugues"

if ! apt-get install  apt-get install texlive-publishers texlive-lang-portuguese texlive-latex-extra texlive-fonts-recommended
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

#echo "instalar Latex completo"
#if ! apt-get install  texlive-full 
#then
#    echo "Não foi possível instalar o pacote"
#    exit 1
#fi
#echo "Instalação finalizada"

if ! apt-get install   texstudio
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"
