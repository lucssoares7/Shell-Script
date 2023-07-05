#evitar problemas na próxima atualização
if ! rm jogos*
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

epoptes-client -c
echo "Desligando."

sleep 2

reboot

echo "Configuração finalizada"


