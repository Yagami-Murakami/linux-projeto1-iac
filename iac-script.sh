#!/bin/bash

# Script para criação automática de usuários, grupos, diretórios e permissões no Linux

# Verifica se o script está sendo executado como root
if [ "$EUID" -ne 0 ]; then
    echo "Este script precisa ser executado como root. Use sudo."
    exit 1
fi

# Definindo grupos
echo "Criando grupos..."
groupadd GRP_ADM
groupadd GRP_VEN
groupadd GRP_SEC

# Criando usuários e associando aos grupos
echo "Criando usuários e associando aos grupos..."

# Usuários do grupo GRP_ADM
useradd -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123) carlos
useradd -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123) maria
useradd -m -s /bin/bash -G GRP_ADM -p $(openssl passwd -crypt Senha123) joao

# Usuários do grupo GRP_VEN
useradd -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123) debora
useradd -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123) sebastiana
useradd -m -s /bin/bash -G GRP_VEN -p $(openssl passwd -crypt Senha123) roberto

# Usuários do grupo GRP_SEC
useradd -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123) josefina
useradd -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123) amanda
useradd -m -s /bin/bash -G GRP_SEC -p $(openssl passwd -crypt Senha123) rogerio

# Criando diretórios
echo "Criando diretórios..."
mkdir -p /publico
mkdir -p /adm
mkdir -p /ven
mkdir -p /sec

# Configurando permissões dos diretórios
echo "Configurando permissões..."

# Diretório público: leitura, escrita e execução para todos
chmod 777 /publico

# Diretório adm: apenas o grupo GRP_ADM tem acesso total
chown :GRP_ADM /adm
chmod 770 /adm

# Diretório ven: apenas o grupo GRP_VEN tem acesso total
chown :GRP_VEN /ven
chmod 770 /ven

# Diretório sec: apenas o grupo GRP_SEC tem acesso total
chown :GRP_SEC /sec
chmod 770 /sec

echo "Configuração concluída com sucesso!"
