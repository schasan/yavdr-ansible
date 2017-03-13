#!/bin/bash
if (( $EUID != 0 )); then
    echo "This script must be run using sudo or as root"
    exit
fi

apt-get -y install software-properties-common
# Add repository for ansible
add-apt-repository -y ppa:ansible/ansible
# update packages
apt-get update
# install required packages
apt-get -y install ansible python

# TODO: run ansible on local host
ansible-playbook yavdr07.yml -b -i 'localhost,'
