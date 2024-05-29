#!/bin/bash

# Função para descoberta dos discos RAID
discovery() {
  discos=$(sudo ssacli ctrl all show config | grep physicaldrive | awk '{print $2}')

  echo '{'
  echo '  "data":['
  first=1
  for disco in $discos; do
    if [ $first -ne 1 ]; then
      echo '    ,'
    fi
    first=0
    echo '    { "{#DISKID}":"'"$disco"'" }'
  done
  echo '  ]'
  echo '}'
}

# Função para verificar o estado de um disco específico
state() {
  disco=$1
  estado=$(sudo ssacli ctrl slot=0 pd $disco show detail | grep -i "status" | awk -F": " '{print $2}')
  echo $estado
}

# Controle de fluxo do script
case "$1" in
  discovery)
    discovery
    ;;
  state)
    state $2
    ;;
  *)
    echo "Usage: $0 {discovery|state <diskid>}"
    exit 1
    ;;
esac
