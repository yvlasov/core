#!/usr/bin/env bash
source conf/source.global

ansible-playbook -i ${ANSIBLE_INVENTORY_FILE} provisioning/containers.yml ${ANSIBLE_OPTS}