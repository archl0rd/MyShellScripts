#!/bin/bash
#script para mostrar informações sobre a máquina
clear
echo " "
echo "######################################"
echo "---------------------------------------"
echo "Informações sobre o disco     :        "
echo "---------------------------------------"
df -h | grep vda1 | awk '{print $1 " (" $2 ")~("$3" - "$5")-(restante: "$4")"}'
echo "---------------------------------------"
echo "######################################"
