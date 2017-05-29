#!/bin/bash
clear
echo " "
echo "######################################"
echo "--------------------------------------"
echo "Usuários criados no servidor:"
echo "--------------------------------------"
awk -F : '$3 >= 500 {print "Usuário: " $1}' /etc/passwd | grep -v '^nobody'
echo "--------------------------------------"
echo " "
echo "---------------------------------------"
echo "Usuários online via TUNELAMENTO: "
echo "---------------------------------------"
ps aux | grep 'priv' | grep 'sshd:' | awk '{print $12" - PID("$2") CPU("$3") MEM("$4")"}'
echo "---------------------------------------"
echo " "
echo "---------------------------------------"
echo "Usuários online via SSH: "
echo "---------------------------------------"
ps aux | grep 'sshd' | grep '@pts' | awk '{print $12" - PID("$2") CPU("$3") MEM("$4")"}'
echo "---------------------------------------"
echo " "
echo "---------------------------------------"
echo "Informações sobre o disco     :        "
echo "---------------------------------------"
df -h | grep vda1 | awk '{print $1 " (" $2 ")~("$3" - "$5")-(restante: "$4")"}'
echo "---------------------------------------"
echo "######################################"
echo " "
echo " "
