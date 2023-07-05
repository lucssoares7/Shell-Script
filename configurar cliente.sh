#!/bin/bash
#executar script:  bash instalador.sh
 
#ip_servidor_porta=192.168.0.200:3128
#aluno="aluno"

echo Atualizando repositórios..
if ! apt-get update
then
    echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi
echo "Atualização feita com sucesso"

echo "Atualizando pacotes já instalados"
if ! apt-get dist-upgrade -y
then
    echo "Não foi possível atualizar pacotes."
    exit 1
fi
echo "Atualização de pacotes feita com sucesso"

echo Atualizando repositórios..
if ! apt install curl wget apt-transport-https dirmngr
then
    #echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi
echo "Atualização feita com sucesso"

#note que $1 aqui será substituído pelo Bash pelo primeiro argumento passado em linha de comando
if ! apt-get install $1
then
    echo "Não foi possível instalar o pacote $1"
    exit 1
fi
echo "Instalação finalizada"

echo "corrigir dependências"
if ! apt-get -f install 
then
    echo "Não foi possível corrigir as dependencias "
    exit 1
fi
echo "Instalação finalizada"

echo "corrigir dependências"
if ! dpkg --configure -a 
then
    echo "Não foi possível corrigir as dependencias "
    exit 1
fi
echo "Instalação finalizada"


echo "instalar jogos"
if ! apt-get install gcompris ktuberling tuxmath tuxpaint gnome-chess supertux 
then
    echo "Não foi possível instalar o pacote $1"
    exit 1
fi
echo "Instalação finalizada"

echo "instalar pacotes uteis"
if ! apt-get install kde-l10n-ptbr artha p7zip-rar
then
    echo "Não foi possível instalar o pacote $1"
    #exit 1
fi
echo "Instalação finalizada"

echo "instalar programas de desenvolvimento"
if ! apt-get install geany gedit gpt gcc scratch kturtle 
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

echo "instalar softwares utilitários"
if ! apt-get install pidgin nautilus 
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

echo "instalar plugins"
if ! apt-get install flashplugin-nonfree 
then
    echo "Não foi possível instalar o pacote"
    #exit 1
fi
echo "Instalação finalizada"

echo "baixar e  min"
if ! rm Min*.deb
then 
	echo "erro ao remover arquivos do Min"
fi
	echo "remover arquivos antigos do Min"

echo "verificar se min está instalado"
if ! apt show min
then
    echo "Não está instalado"
    wget https://github.com/minbrowser/min/releases/download/v1.7.1/Min_1.7.1_amd64.deb
    echo "iniciar instalação"
	if ! dpkg -i Min_1.7.1_amd64.deb
	then
		echo "erro de dependencias"
		dpkg --configure -a 
		if ! dpkg -i Min_1.7.1_amd64.deb
		then
			echo "erro de novo"
			if ! gdebi Min_1.7.1_amd64.deb
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

echo "verificar se min está instalado"
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


echo "instalar softwares educativos"
if ! apt-get install klavaro ktouch
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

#echo "Configurar o proxy http para o servidor"
#if !  export {http,https,ftp}_proxy=192.168.0.200:3128
#then
#    echo "Não foi possível configurar o proxy do sistema"
#    #exit 1
#fi
#echo "Configuração de proxy concluída finalizada"

echo "remover softwares desnecessários"
if ! apt-get remove  mousepad
then
    echo "Não foi possível remover o pacote"
    exit 1
fi
echo "Instalação finalizada"

echo "remover softwares desnecessários"
if ! apt-get remove google-chrome-stable
then
    echo "Não foi possível remover o pacote"
    #exit 1
fi
echo "Instalação finalizada"



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

#echo "criar usuarios"
#for ((i=4; i<=6; i++)) do
#useradd -m -d /home/$aluno$i -p $(openssl passwd -1 $aluno$i) -s /bin/bash $aluno$i
#chown -R $nome$i /home/$aluno$i
#echo "Aluno$i criado"
#done
echo "Configurar epoptes"
sed -e "s;SERVER=192.168.0.200;SERVER=192.168.0.11;g" /etc/default/epoptes-client > ar&&mv ar /etc/default/epoptes-client

echo "Executar epoptes"
if ! epoptes-client -c
then
    echo "Não foi possível executar o epoptes"
    exit 1
fi
echo "epoptes executando"

echo "reiniciar"
reboot

