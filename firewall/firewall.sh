#!/bin/bash
# Autor: Adriano Freitas <https://adrianofreitas.me>
#

function input(){

  # REGRAS DE input #
  # Liberar interface localhost
  iptables -A INPUT -i lo -j ACCEPT
  iptables -A INPUT -m state --state ESTABLISHED,RELATED -j ACCEPT

  # Grava um registro no LOG quando recebe um pacote invalido
  iptables -A INPUT -m state --state INVALID -j LOG --log-prefix " FIREWALL: PACOTE INVALIDO "

  # Ignorar Ping (Opcional)
  iptables -A INPUT -p icmp --icmp-type echo-request -j LOG --log-prefix " FIREWALL: PING "
  iptables -A INPUT -p icmp --icmp-type echo-reply -j ACCEPT
  iptables -A INPUT -p icmp --icmp-type echo-request -j DROP


  # Grava um registro no LOG
  # E libera a porta 443 (HTTPS)
  iptables -A INPUT -p tcp --dport 443 -j LOG --log-prefix " FIREWALL: PORTA 443 "
  iptables -I INPUT -p tcp --dport 443 -m state --state NEW -m recent --update --seconds 360 --hitcount 3 -j DROP
  iptables -A INPUT -p tcp --dport 443 -j ACCEPT


  #BLOQUEAR O RESTANTE DAS PORTAS
  iptables -A INPUT -j DROP
}

function output(){
  # REGRAS DE input #
  # Liberar interface localhost e permite conexoes de output
  iptables -A OUTPUT -o lo -j ACCEPT
  iptables -A OUTPUT -m state --state ESTABLISHED,RELATED -j ACCEPT
  iptables -A OUTPUT -m state --state NEW -j ACCEPT
}

function clean(){
	### Exclui todas as regras ###
	### Exclui cadeias customizadas ###
	iptables -F
	iptables -X
	iptables -Z
}

function policy(){
  # DEFAULT POLICY
  # Por padrão todas as conexoes de input, output E REDIRECIONAMENTO
  # serao negadas, exceto se alguma regra disser o contrario
  iptables -P INPUT DROP
  iptables -P FORWARD ACCEPT
  iptables -P OUTPUT ACCEPT
}

function stop(){
	iptables -P INPUT ACCEPT
	iptables -P OUTPUT ACCEPT
	iptables -P FORWARD ACCEPT
}

function help(){
  echo -e "\nExemplo de uso: \n./firewall.sh --start\n./firewall.sh --stop"
  echo -e "\nOutras opcoes:"
  echo -e "	\t--start"
	echo -e "	\t--stop"
	echo -e "	\t--restart"
	echo -e "	\t--help\n"
}

case $1 in
  "")
  #Chama algumas funcoes
  clean
  policy
  input
  output
  echo -e "\nFIREWALL ATIVADO! \n"
  ;;

  --start)
  #Chama algumas funcoes
  clean
  policy
  input
  output
  echo -e "\nFIREWALL ATIVADO! \n"
  ;;

  --stop)
  clean
  stop
  echo -e "\nFIREWALL DESATIVADO! \n"
  ;;

	--help)
	help
	;;

esac
