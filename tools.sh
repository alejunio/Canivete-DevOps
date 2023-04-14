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
##  VERIFICAO DO SO E EXECUCAO DA FUNCAO CORRESPONDENTE
##  ------------------------------------------------------------------------  ##

# Detect OS
if [ -f /etc/os-release ]; then
    . /etc/os-release
    OS=$NAME
else
    OS=$(uname -s)
fi





##  ------------------------------------------------------------------------  ##
##  INSTALACAO DO TERRAFORM
##  ------------------------------------------------------------------------  ##

# Instalacao do terraform 
setupterraform () {
# Verifica se o terraform está instalado
if ! command -v terraform &> /dev/null
then
    clear 
    echo "Terraform não está instalado, instalando terraform..."
    sleep 3
    # Instalação do terraform
    # Perform actions based on OS
if [[ "$OS" == "Debian GNU/Linux" ]] || [[ "$OS" == "Ubuntu" ]]; then
    
    wget -O- https://apt.releases.hashicorp.com/gpg | gpg --dearmor | sudo tee /usr/share/keyrings/hashicorp-archive-keyring.gpg
    echo "deb [signed-by=/usr/share/keyrings/hashicorp-archive-keyring.gpg] https://apt.releases.hashicorp.com $(lsb_release -cs) main" | sudo tee /etc/apt/sources.list.d/hashicorp.list
    sudo apt update && sudo apt install terraform -y
    
elif [[ "$OS" == "CentOS Linux" ]] && [[ "$(cat /etc/centos-release | awk '{print $4}' | awk -F '.' '{print $1}')" == "7" ]]; then
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo yum -y install terraform

elif [[ "$OS" == "CentOS Linux" ]] && [[ "$(cat /etc/centos-release | awk '{print $4}' | awk -F '.' '{print $1}')" == "8" ]]; then
    sudo yum install -y yum-utils
    sudo yum-config-manager --add-repo https://rpm.releases.hashicorp.com/RHEL/hashicorp.repo
    sudo yum -y install terraform
    
else
    # Incompatible system
    echo "Sistema Incompatível!"
fi
fi
}


##  ------------------------------------------------------------------------  ##
##  INSTALACAO DO DOCKER
##  ------------------------------------------------------------------------  ##

# Instalacao do Docker e Docker compose
setupdocker () {
# Verifica se o Docker está instalado
if ! command -v docker &> /dev/null
then
    clear 
    echo "Docker não está instalado, instalando Docker..."
    sleep 3
    # Instalação do Docker
    curl -fsSL https://get.docker.com | bash 
fi
}

##  ------------------------------------------------------------------------  ##
##  INSTALACAO DO ANSIBLE
##  ------------------------------------------------------------------------  ##

# Instalacao do Ansible
setupansible () {

# Verifica se o Ansible está instalado
if ! command --version ansible &> /dev/null
then
    clear 
    echo "Ansible não está instalado, instalando..."
    sleep 3
    # Instalação do terraform
    # Perform actions based on OS

if [[ "$OS" == "Debian GNU/Linux" ]] || [[ "$OS" == "Ubuntu" ]]; then
    
    # Atualiza o cache do apt
    sudo apt update
    # Instala as dependências necessárias
    sudo apt install -y software-properties-common
    sudo apt install -y python3 git unzip htop 
    # Adiciona o repositório do Ansible
    sudo apt-add-repository --yes --update ppa:ansible/ansible
    # Instala o Ansible
    sudo apt install -y ansible
    # Configura Host Ansible Local
    rm -r /etc/ansible/hosts && bash src/ansible_hosts.sh 
    
elif [[ "$OS" == "CentOS Linux" ]] && [[ "$(cat /etc/centos-release | awk '{print $4}' | awk -F '.' '{print $1}')" == "7" ]]; then
    # Instala as dependências necessárias
    yum install -y epel-release
    # Instala o Ansible
    sudo yum install -y ansible
    # Configura Host Ansible Local
    rm -r /etc/ansible/hosts && bash src/ansible_hosts.sh


elif [[ "$OS" == "CentOS Linux" ]] && [[ "$(cat /etc/centos-release | awk '{print $4}' | awk -F '.' '{print $1}')" == "8" ]]; then
    # Instala as dependências necessárias
    yum install -y epel-release
    # Instala o Ansible
    yum install -y @ansible
    # Configura Host Ansible Local
    rm -r /etc/ansible/hosts && bash src/ansible_hosts.sh
   

else
    # Incompatible system
    echo "Sistema Incompatível!"
fi
fi
}

##  ------------------------------------------------------------------------  ##
##  INSTALACAO DO PACKER
##  ------------------------------------------------------------------------  ##