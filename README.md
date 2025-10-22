# CSEC 473 Red Team Tool
Author: Jared Korwatch
Email: jmk9339@rit.edu
Team: Foxtrot

## Goal Of this Tool -- Systemd Persistence

This red team tool utilizes a given ssh public key and deploys it to the set host with persistence through a service.

It can be deployed by changing the required variables listed below in the tutorial section, and then run through deploy.sh

## Tutorial -- Setup
- Ensure that ansible is installed on your system.
    ```bash
    sudo apt install ansible -y
    ```
- Modify the ansible/inventory.ini file to add your target user and host.
- Replace id_rsa.pub with your ssh public key
- Run deploy.sh, and the ansible playbook will run and return the results of the operation.

## Structure
- `ansible/` Configuration for ansible, includes the playbook, config and templates for deployment
- `ansible/templates/system_health_archive.service.j2` Contains the information/config for the faulty service system health archive, ensures persistence through the service.
- `ansible/templates/user_persistence.j2` This is responsible for placing the ssh keys in various users specified in the yml file.
- `deploy.sh` Shell script used for running quick, contains the ansible-playbook command and runs with the inventory file
- `id_rsa.pub` Public ssh key of the red team member. Will be modified in the future to support multiple keys at once.
