#!/bin/bash

nslookup $1 | grep Address > direc

sed '2q;d' direc > direc2

hola=$(cat direc2)

echo "Bloqueando ip" ${hola#Address:} "....."

sudo firewall-cmd --direct --permanent --add-rule ipv4 filter OUTPUT 0 -d $(echo ${hola#Address: }) -j DROP

sudo firewall-cmd --reload 

sudo firewall-cmd --direct --get-all-rules

echo "####################################"

echo "El Sitio fue bloqueado exitosamente!"

echo "####################################"
