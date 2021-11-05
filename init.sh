#!/bin/bash

wc=$(cat clientes.txt | wc -l)

echo "EMPRESA:CODIGO:CONTAGEM_2020:CONTAGEM_2021" > ./relatorio.txt

for i in $(seq 1 $wc)
do

ctrl_number=$(cat clientes.txt | head -n "$i" | tail -n 1 | cut -f1 -d$'        ')
empresa=$(cat clientes.txt | head -n "$i" | tail -n 1 | cut -f2 -d$'    ')
contagem2020=$(du -hsc /usr/src/GRAVACOES_2020/*/$ctrl_number | tail -1 | cut -f1)
contagem2021=$(du -hsc /usr/src/GRAVACOES_2021/BUGATTI/*/$ctrl_number | tail -1 | cut -f1)

echo ""$empresa":"$ctrl_number":"$contagem2020":"$contagem2021"" >> ./relatorio.txt
done