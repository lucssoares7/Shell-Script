echo "Removendo diretório.."
if ! rm /etc/apt/sources.list.d/google.list
then
    echo "Não foi remover diretorio"
fi
echo "diretório removido com sucesso"

#evitar problemas na próxima atualização
if ! rm update*
then
    echo "Não foi remover arquivo de update"
    exit 1
fi
echo "arquivos de update limpo do sistema"

echo "removendo bloqueios de atualização" 


if ! rm /var/lib/apt/lists/lock && rm /var/cache/apt/archives/lock
then
    echo "Não foi remover arquivo de update"
    exit 1
fi
echo "arquivos de update limpo do sistema"


echo "Atualizando repositórios.."
if ! apt-get -y update --fix-missing
then
    echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    #apt-get update --fix-missing
    #exit 1
    apt install -f
fi
echo "Atualização feita com sucesso"


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

echo "Atualizando pacotes já instalados"
if ! dpkg --configure -a
then
    echo "Não foi possível atualizar pacotes."
    exit 1
fi
echo "Atualização de pacotes feita com sucesso"

echo "Atualizando pacotes já instalados"
if ! apt-get update --fix-missing -y
then
    echo "Não foi possível atualizar pacotes."
    exit 1
fi
echo "Atualização de pacotes feita com sucesso"

echo "Atualizando pacotes já instalados"
if ! mintupdate-cli upgrade -r -y
then
    echo "Não foi possível atualizar pacotes."
    exit 1
fi
echo "Atualização de pacotes feita com sucesso"

echo "limpar pacotes com erros"
if ! apt-get autoclean -y
then
    echo "Não foi possível limpar o sistema"
    exit 1
fi
echo "limpeza concluída"

echo "limpar dependencias"
if ! apt-get autoremove -y
then
    echo "Não foi possível limpar o sistema"
    exit 1
fi
echo "limpeza concluída"

echo "instalar O A.D."
if ! flatpak install --from https://flathub.org/repo/appstream/com.play0ad.zeroad.flatpakref
then
    echo "O jogo não pode ser instalado"
fi
echo "Jogo instalado com sucesso"

echo "instalar jogos"
if ! apt-get install gcompris-qt ktuberling tuxmath tuxpaint gnome-chess supertux minetest scratch supertuxkart
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"

echo "instalar WPS Office"
if !snap install wps-office-all-lang-no-internet
then    
    echo "Não foi possível instalar o wps"
    exit 1
fi
echo "Instalação feita com sucesso"

rm /usr/share/xfce4/backdrops/book*
rm /usr/share/xfce4/backdrops/sele*
rm /usr/share/xfce4/backdrops/e*
rm /usr/share/xfce4/backdrops/k*
rm /usr/share/xfce4/backdrops/linux*

epoptes-client -c
echo "Desligando."

sleep 2

shutdown

echo "Configuração finalizada"
