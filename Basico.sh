#!/bin/bash
echo "Copiando novo source list"
if !cp -u sources.list /etc/apt
then
    echo "Não foi copiar"
    exit 1
fi
echo "copia feita com sucesso"

sed -i -e 's/deb http/deb [arch=amd64] http/' "/etc/apt/sources.list.d/google-chrome.list"
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | apt-key add -

echo "Atualizando repositórios.."
if ! apt-get update
then
    echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi
echo "Atualização feita com sucesso"

#apt install curl wget apt-transport-https dirmngr

echo "Atualizando repositórios.."
if ! apt-get upgrade -y
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

echo "remover softwares desnecessários"
if ! apt-get remove  mousepad
then
    echo "Não foi possível remover o pacote"
    exit 1
fi
echo "Remoção finalizada"

echo "atualizar o sistema"

if ! apt-get update
then
    echo "Não foi possível atualizar o sistema"
    exit 1
fi
echo "atualização concluída"

if ! apt-get dist-upgrade
then
    echo "Não foi possível atualizar o sistema"
    exit 1
fi
echo "atualização concluída"


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

echo "instalar whisker menu"

if ! apt-get install xfce4-whiskermenu-plugin 
then
    echo "Não foi possível instalar o whisker"
    exit 1
fi
echo "whisker instalador com sucesso"

echo "instalar jogos"
if ! apt-get install gcompris ktuberling tuxmath tuxpaint gnome-chess supertux minetest
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

echo "instalar pacotes uteis"
if ! apt-get install kde-l10n-ptbr artha p7zip-rar curl wget apt-transport-https dirmngr
then
    echo "Não foi possível instalar o pacote $1"
    #exit 1
fi
echo "Instalação finalizada"

echo "Instalar softwares utilitários"
if ! apt-get install pidgin nautilus gedit geany epoptes-client
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"


echo "instalar softwares educativos"
if ! apt-get install klavaro ktouch
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

echo "iniciar epoptes"
if ! epoptes-client -c
then
    echo "Não foi possível iniciar o epoptes"
    exit 1
fi
echo "Instalação finalizada"

echo "Configuração finalizada"
reboot
