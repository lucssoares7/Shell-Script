echo "instalar O A.D."

if ! flatpak install --from https://flathub.org/repo/appstream/com.play0ad.zeroad.flatpakref
then
    echo "O jogo não pode ser instalado"
fi
echo "Jogo instalado com sucesso"
