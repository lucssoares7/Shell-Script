#!/bin/bash 

echo "instalar jogos"
if ! apt-get install gcompris ktuberling tuxmath tuxpaint gnome-chess supertux 
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

