#!/bin/bash
# archl0rd - adrianofreitas.me

passwd="password"
user="username"
group="username"

# Cria grupo aluno
groupadd $group

# adiciona usuario
useradd -M -d /home/$user -p $(openssl passwd -1 $passwd) -s /bin/bash -g $group $user

# cria pasta do usuario
mkdir /home/$user

# altera dono da pasta
chown -R $user /home/$user

#Adiciona usuario aos grupos
sudo usermod -a -G disk $user
sudo usermod -a -G lp $user
sudo usermod -a -G cdrom $user
sudo usermod -a -G audio $user
sudo usermod -a -G video $user
sudo usermod -a -G disk $user
sudo usermod -a -G users $user
sudo usermod -a -G disk $user
sudo usermod -a -G pulse $user
echo "Usuario $user criado"
sleep 10
