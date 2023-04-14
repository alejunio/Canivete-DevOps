#!/bin/bash 

##
##  container.sh - Canivete DevOps
##
##  Site       : https://alexjunio.com.br
##  Autor      : Alex Junio <contato@alexjunio.com.br>
## 
##  ------------------------------------------------------------------------  ##
##  Esse script automatiza o setup de diversas ferramentas
##  como: Docker, Portainer, Traefik
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
##  INSTALACAO DO PORTAINER
##  ------------------------------------------------------------------------  ##

# Instalacao do Portainer 

setupportainer () {
# Verifica se o Docker está instalado
if ! command -v docker &> /dev/null
then
    clear 
    echo "Docker não está instalado, instalando Docker e o Portainer..."
    sleep 3
    # Instalação do Docker
    curl -fsSL https://get.docker.com | bash 
    # Criando volume para portainer 
    docker volume create portainer_data
    # Criando container portainer
    docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce
    # Instalando agente portainer
    docker run -d -p 9001:9001 --name portainer_agent --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v /var/lib/docker/volumes:/var/lib/docker/volumes portainer/agent:2.17.1
    
fi
}