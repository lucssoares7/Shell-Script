#!/bin/bash
echo "corrigir dependências"
if ! apt-get -f install 
then
    echo "Não foi possível corrigir as dependencias "
    exit 1
fi
echo "Dependências corrigidas"

echo "corrigir dependências"
if ! dpkg --configure -a 
then
    echo "Não foi possível corrigir as dependencias "
    exit 1
fi
echo "Dependências corrigidas"
