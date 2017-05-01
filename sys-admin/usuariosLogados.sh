#!/bin/bash
#script para listar usuarios logados na máquina via SSH
clear
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
