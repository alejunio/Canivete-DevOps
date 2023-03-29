#!/bin/bash 

##
##  setup.sh - Canivete DevOps
##
##  Site       : https://alexjunio.com.br
##  Autor      : Alex Junio <contato@alexjunio.com.br>
## 
##  ------------------------------------------------------------------------  ##
##  Esse script automatiza o setup de diversas ferramentas
##  como: Docker, Ansible, Terraform e outros.
##  ------------------------------------------------------------------------  ##


##  ------------------------------------------------------------------------  ##
##  CORES P/ TERMINAL
##  ------------------------------------------------------------------------  ##

red=`echo -en "\e[31m"`
normal=`echo -en "\e[0m"`
green=`echo -en "\e[32m"`
orange=`echo -en "\e[33m"`
blue=`echo -en "\e[34m"`
bold=`echo -en "\e[1m"`


##  ------------------------------------------------------------------------  ##
##  SOURCES
##  ------------------------------------------------------------------------  ##

# Variaveis
source .env
# Tools 
source tools.sh
# Core basico
source init.sh


##  ------------------------------------------------------------------------  ##
##  MENU DE OPCOES
##  ------------------------------------------------------------------------  ##

while true; do
    clear
    echo "Menu de opções:"
    echo "+-------+---------+-------------------+-------+--------------------------------------+"
    echo "|  IaC            |  Container        | CI/Cd         |  Observabilidade e Logs      |"
    echo "+-----------------+------------------------------------------------------------------+"
    echo "|  1 - Terraform  |  4 - Docker       |  7 - Harness  |   10 - Grafana Prometheus    |"
    echo "|  2 - Packer     |  5 - Portainer    |  8 - Argo CD  |   11 - Grafana Loki          |"
    echo "|  3 - Ansible    |  6 - Traefik      |  9 - GoCD     |   12 - Graylog               |"
    echo "+-----------------------------------------------------------------------------------+"
    echo "|  13 - Sair                                                                         |"
    echo "+------------------------------------------------------------------------------------+"
    echo 
    read -p "Digite o número da opção desejada: " opcao

    case $opcao in
        1)
            echo "Instalando Terraform..."
            # Instalacao do Terraform
            read -p "Pressione enter para continuar..."
            setupterraform
            clear 
            echo "Versão do terraform instalado" 
            terraform -v
            echo 
            echo "Voltando ao menu..."
            sleep 5
            ;;
        2)
            echo "Instalando Packer..."
            # Comando para instalar o Packer
            read -p "Pressione enter para continuar..."
            ;;
        3)
            echo "Instalando Ansible..."
            # Comando para instalar o Ansible
            read -p "Pressione enter para continuar..."
            ;;
        4)
            echo "Instalando Docker..."
            # Instalacao do Docker
            read -p "Pressione enter para continuar..."
            setupdocker
            clear 
            echo "Versões Docker e Docker-compose instalados" 
            docker --version
            docker compose version
            echo 
            echo "Voltando ao menu..."
            sleep 5   
            ;;
        5)
            echo "Instalando Portainer..."
            # Comando para instalar o Portainer
            read -p "Pressione enter para continuar..."
            ;;
        6)
            echo "Instalando Traefik..."
            # Comando para instalar o Traefik
            read -p "Pressione enter para continuar..."
            ;;
        7)
            echo "Instalando Harness..."
            # Comando para instalar o Harness
            read -p "Pressione enter para continuar..."
            ;;
        8)
            echo "Instalando Grafana..."
            # Comando para instalar o Grafana
            read -p "Pressione enter para continuar..."
            ;;
        9)
            echo "Instalando Grafana..."
            # Comando para instalar o Grafana
            read -p "Pressione enter para continuar..."
            ;;
        10)
            echo "Instalando Grafana..."
            # Comando para instalar o Grafana
            read -p "Pressione enter para continuar..."
            ;;
        11)
            echo "Instalando Grafana..."
            # Comando para instalar o Grafana
            read -p "Pressione enter para continuar..."
            ;;
        12)
            echo "Instalando Grafana..."
            # Comando para instalar o Grafana
            read -p "Pressione enter para continuar..."
            ;;
        13)
            echo "Encerrando o programa..."
            exit 0
            ;;
        *)
            echo "Opção inválida, tente novamente."
            read -p "Pressione enter para continuar..."
            ;;
    esac
done