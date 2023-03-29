#!/bin/bash


cat > /etc/ansible/hosts << END
[Control]
127.0.0.1 ansible_connection=local
END
