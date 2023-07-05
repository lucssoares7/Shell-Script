echo "instalar google chrome"
sh -c 'echo "deb [arch=amd64] http://dl.google.com/linux/chrome/deb/ stable main" >> /etc/apt/sources.list.d/google.list'
wget -q -O - https://dl.google.com/linux/linux_signing_key.pub | sudo apt-key add -

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


echo "instalar jogos"
if ! apt-get install gcompris-qt ktuberling tuxmath tuxpaint gnome-chess supertux minetest scratch 
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

echo "instalar pacotes uteis"
if ! apt-get -yinstall kde-l10n-ptbr artha p7zip-rar curl wget apt-transport-https dirmngr gdebi google-chrome-stable
then
    echo "Não foi possível instalar o pacote $1"
    #exit 1
fi
echo "Instalação finalizada"

echo "Instalar softwares utilitários"
if ! apt-get -y install pidgin nautilus gedit geany epoptes-client xdotool
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"


echo "instalar softwares educativos"
if ! apt-get -y install klavaro ktouch kturtle
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

rm /usr/share/xfce4/backdrops/book*
rm /usr/share/xfce4/backdrops/sele*
rm /usr/share/xfce4/backdrops/e*
rm /usr/share/xfce4/backdrops/k*
rm /usr/share/xfce4/backdrops/linux*

apt-get install -y google-chrome-stable

echo ".....CONFIGURANDO EPOPTES CLIENT....."
sleep 2
echo "DIGITE O IP DO SERVIDOR COM OS PONTOS"
read ip;
sed -i "s/#SERVER=server/SERVER=$ip/g" /etc/default/epoptes-client
epoptes-client -c
echo "Reiniciando."
sleep 2
echo "Reiniciando.."
sleep 2
echo "Reiniciando..."
sleep 2
shutdown

echo "Configuração finalizada"


reboot
