#!/bin/bash
# archl0rd - adrianofreitas.me
passwd="password"
user="username"
group="username"

for ((i=10; i<100; i++)) do
  # Cria grupo
  groupadd $group
  # adiciona usuario
  useradd -M -d /home/$user$i -p $(openssl passwd -1 $passwd) -s /bin/bash -g $group $user$i
  # cria pasta do usuario
  mkdir /home/$user$i
  # altera dono da pasta
  chown -R $user$i /home/$user$i
  #Adiciona usuario aos grupos
  echo "Usuario $user$i criado"
  sleep 1
done
