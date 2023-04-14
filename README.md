# Canivete-DevOps - Em desenvolvimento
O Canivete-DevOps é uma automação em Script Shell para instalação de diversas ferramentas do mundo DevOps como: Ansible, Terraform, Docker e muitas outras.

O objetivo desse script é acelerar o setup inicial de uma máquina de dev e/ou laboratório para desenvolvermos nossos queridos e sofridos projetos.

Sinta-se livre para compartilhar ou colaborar com esse respositório.

## Confira o lançamento das features 
https://github.com/users/alejunio/projects/1

## Tools DevOps

#### Ferramentas IaC

- Terraform [ok]
- Packer
- Ansible


#### Ferramentas Container 

- Docker [ok]
- Portainer
- Traefik 


#### Ferramentas CI/CD

- Harness
- Argo CD
- GoCD


#### Ferramentas Observabilidade e Logs

- Gafana e Prometheus
- Grafana Loki 
- Graylog


## Instalação 

Clone o repositório
```shell
cd /home/ && git clone https://github.com/alejunio/Canivete-DevOps.git
```

Instale os pacotes essênciais
```shell
chmod +x /home/Canivete-DevOps/*.sh && cd /home/Canivete-DevOps/
```

Execute o Canivete DevOps
```shell
cd /home/Canivete-DevOps/ && bash setup.sh
```