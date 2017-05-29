#!/bin/bash
# Autor: Adriano Freitas - adrianofreitas.me
# Modificado: 27/11/2016

DIR=NULL
N=100
function erase(){
  find $DIR -depth -type f -exec shred -zvu -n $N '{}' \;
  rm -R $DIR
}

function help() {
  echo "Shred-R 0.1 - 2016 Adriano Freitas"
  echo -e "\nOpções obrigatórias:"
  echo -e "	\t-d <dir>\tCaminho para o diretório a ser excluído."
  echo -e "\nOpções opcionais:"
	echo -e "	\t-n <num>\tNúmero de vezes que os arquivos serão sobrescritos. (default: 10)"
	echo -e "	\t-h\t\tExibir ajuda.\n"
  echo -e "\nExemplos de uso: \nsh shred-R.sh -d DIR/"
  echo -e "sh shred-R.sh -d DIR/ -n 20"
  echo -e "sh shred-R.sh -d /home/user/DIR/ -n 30"
  echo
}

function main() {
  while [ -n "$1" ]; do
    case "$1" in
      -d)
      if [ -d "$2" ]; then
        DIR=$2
      else
        echo "Diretório inexistente ou inválido!"
      fi
      break
      ;;

      -n)
      if let $2 2>/dev/null; then
        N=$2
      fi
      break
      ;;
      -h | --help)
      help
      ;;
      -*)
      help
      break
      ;;
    esac
    shift
  done

  if [ -d "$DIR" ]; then
    erase
    #echo $DIR
    echo $N
  else
    echo -e "'sh shred-R.sh --help' para ajuda."
  fi
}

main "$@"
