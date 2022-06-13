#!/bin/bash

dat=$(date +%F)

echo 'Todays date is ', ${dat}

addition=$((2+3))
echo 'Addition of two numbers is' , ${addition}

echo USER=${USER}
echo A=${A}

read -p 'enter ur age ' age
echo -e "\e[34mYour age is ${age} but dont worry age is just the \e[1;32mNumber\e[0m"

