#!/bin/bash
# Autor: Adriano Freitas - adrianofreitas.me
# Modificado: 27/11/2016

DIR=NULL
N=NULL
function erase(){
  find $DIR -depth -type f -exec shred -zvu -n $N '{}' \;
  rm -R $DIR
}

function help() {
  clear
  echo "Shred-R 0.1 - 2017 Adriano Freitas"
  echo -e "\nOpções obrigatórias:"
  echo -e "	\t<dir>\tCaminho para o diretório a ser excluído."
  echo -e "\nOpções opcionais:"
	echo -e "	\t<num>\tNúmero de vezes que os arquivos serão sobrescritos. (default: 10)"
	echo -e "	\t--help\t\tExibir ajuda.\n"
  echo -e "\nExemplos de uso: \n"
  echo -e "sh shredR.sh PATH/TO/DIR/"
  echo -e "sh shredR.sh PATH/TO/DIR/ 20"
  echo -e "sh shredR.sh PATH/TO/DIR/ 30"
  echo
  echo -e "'sh shred-R.sh --help'\t para ajuda."
}

function main() {
  if [ -d "$1" ]; then
    DIR=$1
  else
    echo "Diretório inexistente ou inválido!"
  fi

  if let $2 2>/dev/null; then
    N=$2
  else
    N=100
  fi

  if [ -d "$DIR" ]; then
    erase
  else
    help
  fi
}

main "$@"
