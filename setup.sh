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
    echo "+--------------------+-------------------+"
    echo "|  IaC               |  Container        |"
    echo "+--------------------+-------------------+"
    echo "|  1 - Terraform     |  4 - Docker       |"  
    echo "|  2 - Packer        |  5 - Portainer    |"  
    echo "|  3 - Ansible       |  6 - Traefik      |"  
    echo "+--------------------+-------------------+"
    echo "|  CI/Cd             |  Observabilidade  |" 
    echo "+--------------------+-------------------+"
    echo "|  7 - Harness       | 10 - Grafana      |"  
    echo "|  8 - Argo CD       | 11 - Prometheus   |"  
    echo "|  9 - GoCD          |                   |"  
    echo "+--------------------+-------------------+"
    echo "|  Logs              |  CLI Clouds       |" 
    echo "+--------------------+-------------------+"
    echo "|  12 - Grafana Loki | 14 - AWS CLI      |" 
    echo "|  13 - Graylog      | 15 - GCP CLI      |"  
    echo "|                    | 16 - DigitalOcean |" 
    echo "+--------------------+-------------------+"
    echo "|  17 - Sair                             |"                                               
    echo "+----------------------------------------+"
    echo 
    read -p "Digite o número da opção desejada: " opcao

    case $opcao in
        1)
            echo "Iniciando Setup Terraform..."
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
            echo "Iniciando Setup Packer..."
            # Comando para instalar o Packer
            read -p "Pressione enter para continuar..."
            ;;
        3)
            echo "Iniciando Setup Ansible..."
            # Comando para instalar o Ansible
            read -p "Pressione enter para continuar..."
            setupansible
            echo 
            echo "Versao Ansible" 
            ansible --version | grep core
            echo 
            echo "Voltando ao menu..."
            sleep 5 
            ;;
        4)
            echo "Iniciando Setup Docker..."
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
            echo "Iniciando Setup Portainer..."
            # Comando para instalar o Portainer
            read -p "Pressione enter para continuar..."
            ;;
        6)
            echo "Iniciando Setup Traefik..."
            # Comando para instalar o Traefik
            read -p "Pressione enter para continuar..."
            ;;
        7)
            echo "Iniciando Setup Harness..."
            # Comando para instalar o Harness
            read -p "Pressione enter para continuar..."
            ;;
        8)
            echo "Iniciando Setup Grafana..."
            # Comando para instalar o Grafana
            read -p "Pressione enter para continuar..."
            ;;
        9)
            echo "Iniciando Setup Grafana..."
            # Comando para instalar o Grafana
            read -p "Pressione enter para continuar..."
            ;;
        10)
            echo "Iniciando Setup Grafana..."
            # Comando para instalar o Grafana
            read -p "Pressione enter para continuar..."
            ;;
        11)
            echo "Iniciando Setup Grafana..."
            # Comando para instalar o Grafana
            read -p "Pressione enter para continuar..."
            ;;
        12)
            echo "Iniciando Setup Grafana..."
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