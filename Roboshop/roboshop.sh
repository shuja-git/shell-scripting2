#!/bin/bash
USER_UID=$(id -u)
if [ "${USER_UID}" -ne 0 ]; then
  echo -e "\e[1;31mU should be root user to perform this task\e[0m"
  exit
fi

COMPONENT=$1
if [ -z "${COMPONENT}" ]; then
    echo -e "\e[1;31mComponent Input Missing\e0m"
    exit
fi
if [ ! -e components/${COMPONENT}.sh ]; then
   echo -e "\e[1;31mGiven Compnent script does not exists\e[0m"
  exit
fi

bash components/${COMPONENT}.sh
