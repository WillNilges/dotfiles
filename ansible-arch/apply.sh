#!/bin/bash
#ansible-playbook -i 127.0.0.1, --connection=local main.yml
ansible-playbook -i inventory main.yml -K
