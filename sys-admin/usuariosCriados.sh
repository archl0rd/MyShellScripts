#!/bin/bash
#script para listar usuarios criados na máquina via SSH
clear
echo " "
echo "######################################"
echo "--------------------------------------"
echo "Usuários criados no servidor:"
echo "--------------------------------------"
awk -F : '$3 >= 500 {print "Usuário: " $1}' /etc/passwd | grep -v '^nobody'
echo "--------------------------------------"
echo " "
