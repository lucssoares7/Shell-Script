#!/bin/bash

echo "Atualizando repositórios.."
if ! apt-get update
then
    echo "Não foi possível atualizar os repositórios. Verifique seu arquivo /etc/apt/sources.list"
    exit 1
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

sed -i -e 's/deb http/deb [arch=amd64] http/' "/etc/apt/sources.list.d/google-chrome.list"


