## É a receita de como o projeto deve ser executado

## slim é baseado no ubuntu
FROM node:17-slim

RUN apt-get update \ 
&& apt-get install -y build-essential graphicsmagick imagemagick
## serão 3 instalações
## build-essential é uma dependência para imagemagick

## Pasta de trabalho
WORKDIR /meme-generator/

# É uma BOA PRÁTICA ter cache, o copy vai ser executado uma vez...
## Copia os arquivos
COPY package.json package-lock.json /meme-generator/
## Executa o CI para restaurar as dependências
## O ci ao contrário do install vai olhar o package-lock.json e ver qual foi a última versão que rodou/funcionou na máquina, no node.js
    ## Ou seja, ele vai garantir que vai instalar as versões exatas que funcionaram na máquina anteriormente
    ## O install vai baixar a versão mais recente ou instalar com algum package de correção que pode quebrar o código
## --silent para não mostrar o console
RUN npm ci --silent

## Add tudo que está na pasta de trabalho para o container
COPY . .

## Por segurança, usa-se o usuário node 
## porque ele não tem premissão para acessar o sistema operacional
## assim o container não invade a própria máquina
USER node

## Executa o projeto
CMD npm run live-reload
