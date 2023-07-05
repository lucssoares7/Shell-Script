#!/bin/bash

echo "instalar whisker menu"

if ! add-apt-repository ppa:gottcode/gcppa
then
    echo "Não foi possível adicionar o ppa"
    exit 1
fi
echo "ppa adicionado com sucesso"

if ! apt-get update
then
    echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
fi
echo "Atualização feita com sucesso"

if ! apt-get install xfce4-whiskermenu-plugin
then
    echo "Não foi possível instalar o pacote"
    exit 1
fi
echo "Instalação finalizada"
