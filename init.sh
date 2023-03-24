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
##  INSTALACAO BASICA DE PACOTES E SISTEMA
##  ------------------------------------------------------------------------  ##

# Debian 8+ Ubuntu 18+
ubuntu_debian() {

# Update de pacotes
sudo apt update 
# Instalacao de pacotes
sudo apt-get install -y software-properties-common htop
# Liberacao de portas no firewall
sudo ufw allow 8088,7080,443,80/tcp

}

# CentOS 7
centos7() {

# Instalacao de pacotes    
yum install -y epel-release
yum -y install yum-utils htop
# Liberacao de portas no firewall
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=7080/tcp
firewall-cmd --reload
}

# CentOS 8
centos8() {

# Instalacao de pacotes
yum install -y epel-release
yum -y install yum-utils htop
# Liberacao de portas no firewall
firewall-cmd --permanent --add-port=443/tcp
firewall-cmd --permanent --add-port=80/tcp
firewall-cmd --permanent --add-port=7080/tcp
firewall-cmd --reload
}


##  ------------------------------------------------------------------------  ##
##  VERIFICAO DO SO E EXECUCAO DA FUNCAO CORRESPONDENTE
##  ------------------------------------------------------------------------  ##

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
else
    OS=$(uname -s)
fi

# Perform actions based on OS
if [[ "$OS" == "Debian GNU/Linux" ]] || [[ "$OS" == "Ubuntu" ]]; then
    clear
    echo "Instalando ferramentas basicas"
    echo 
    ubuntu_debian
    
elif [[ "$OS" == "CentOS Linux" ]] && [[ "$(cat /etc/centos-release | awk '{print $4}' | awk -F '.' '{print $1}')" == "7" ]]; then
    clear
    echo "Instalando ferramentas basicas"
    echo 
    centos7

elif [[ "$OS" == "CentOS Linux" ]] && [[ "$(cat /etc/centos-release | awk '{print $4}' | awk -F '.' '{print $1}')" == "8" ]]; then
    clear
    echo "Instalando ferramentas basicas"
    echo 
    centos8
    
else
    # Incompatible system
    echo "Sistema Incompatível!"
fi
