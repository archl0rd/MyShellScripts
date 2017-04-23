#!/bin/bash
# archl0rd - adrianofreitas.me
# 06/04/2017

passwd="Senha_Antiga"
newpasswd="Nova_Senha"
user="administrador"
group="administrador"

# Cria grupo aluno
groupadd $group

# adiciona usuario
#useradd -M -d /home/$user -p $(openssl passwd -1 $passwd) -s /bin/bash -g $group $user

#alterar senha
usermod -p $(openssl passwd -1 $newpasswd) $user

echo "Usuario $user. Senha alterada"
sleep 10
