#!/bin/bash

#note que $1 aqui será substituído pelo Bash pelo primeiro argumento passado em linha de comando
#if ! apt-get install $1
#then
#    echo "Não foi possível instalar o pacote $1"
#    exit 1
#fi
#echo "Instalação finalizada"

echo "Instalar Browser Min"

echo "baixar o  min"
if ! rm Min*.deb
then 
	echo "erro ao remover arquivos do Min"
fi
	echo "remover arquivos antigos do Min"

echo "verificar se min está instalado"
if ! apt show min
then
    echo "Não está instalado"
    wget https://github.com/minbrowser/min/releases/download/v*_amd64.deb
    echo "iniciar instalação"
	if ! dpkg -i Min_*_amd64.deb
	then
		echo "erro de dependencias"
		dpkg --configure -a 
		if ! dpkg -i Min_*_amd64.deb
		then
			echo "erro de novo"
			if ! gdebi Min_*_amd64.deb
			then 
				echo "desisto"
				exit 1
			fi
		fi
		echo "remover arquivos de instalação"
		rm Min*.deb
		echo "instalação concluída"
		
	fi
	echo "instalação concluída"

fi
	echo "Está OK"

