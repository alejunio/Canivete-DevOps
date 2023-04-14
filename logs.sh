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

