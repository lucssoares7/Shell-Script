#!/bin/bash

#note que $1 aqui será substituído pelo Bash pelo primeiro argumento passado em linha de comando
#if ! apt-get install $1
#then
#    echo "Não foi possível instalar o pacote $1"
#    exit 1
#fi
#echo "Instalação finalizada"


echo "instalar plugins"
if ! apt-get install flashplugin-nonfree 
then
    echo "Não foi possível instalar o pacote"
    #exit 1
fi
echo "Instalação finalizada"

echo "verificar se flash está instalado"
if ! apt show flashplugin-nonfree
then
	echo "baixando flash"
	wget https://fpdownload.adobe.com/pub/flashplayer/pdc/30.0.0.113/flash_player_npapi_linux.x86_64.tar.gz -O flash.tar.gz
	tar -zxvf flash*.tar.gz
	echo "download concluido com sucesso"
	cp libflashplayer.so /usr/lib/mozilla/plugins/
	cp -r usr/* /usr
	rm flash.tar.gz
	echo "flash instalado com sucesso"
fi
	echo "flash já está instalado"

