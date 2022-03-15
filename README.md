# docker-meme-maker 🥇

Meme generator with Docker and JavaScript 🚀

## Requeriments ✅

- [Node](https://nodejs.org/en/)
- [Docker](https://www.docker.com)
- [Graphicsmagick](http://www.graphicsmagick.org/index.html)
Biblioteca multiplataforma para edição de imagens.
- [npmjs.com/package/@erickwendel/meme-maker](https://www.npmjs.com/package/@erickwendel/meme-maker)

**Graphicsmagick** e dependências instaladas no container via Docker.

## Docker

1. Defina o ambiente da app com um [Dockerfile](https://docs.docker.com/engine/reference/builder) para que ele possa ser reproduzido em qualquer lugar.

2. Defina os serviços que compõem o app [docker-compose.yml](https://docs.docker.com/compose) para que possam ser executados juntos em um ambiente isolado.

3. **volume**: Configuração para separar as pastas do código js da pasta node_modules, para que o **nodemon** consiga fazer **live-reload** funcione corretamente, pegando somente as modificações de código.

4. Execute o comando **docker compose up** para inicializar a app.
Na primeira execução use o argumento **--build** para a construção do ambiente. Também pode executar este comando usando o binário docker-compose.
  
## Run project locally 🚧

```bash
  #!/bin/bash

  ## Clonar o projeto (OU realizar um FORK):
  git clone git@github.com:heviane/docker-meme-maker.git
  cd docker-meme-maker

  ## Inicializar o projeto:
  npm install
  
  ## Instalar dependência:
  npm install @erickwendel/meme-maker

  ## Instalar o docker:
  sudo snap install docker
  ## OU
  sudo apt install docker-compose

  ## Inicializar a app (Usar argumento --build somente na primeira vez):
  sudo docker-compose up --build
```

Quando usamos **volume**, pegamos o ambiente do docker e espelhamos ele na nossa máquina. No exemplo abaixo, rodamos comandos do imagemagick dentro do container do compose.
  
```bash
  #!/bin/bash
  docker ps
  docker exec -it docker-meme-maker_meme-maker_1 bash
  /meme-generators$

  ## gm é o comando da lib GraphicsMagick instalada no container
  gm -version
  ## Copia a imagem da pasta img/ para a pasta raiz
  gm -convert "img/sorry.jpg" -monochrome sorry.jpg
```

- **-it** é para modo iterativo.
- **docker-meme-maker_meme-maker_1** é nome da imagem.
- **bash** é como se estivesse acessando via ssh.

Com isso validamos se está tudo certo com o ambiente.

## Funcionamento 🚀

Ao executar o **index.js**, as modificações configuradas são realizadas com base na imagem de entrada, gerando assim a imagem de saída.

Estamos usando o **nodemon**, então a cada modificação salva no arquivo "index.js" a app é restartada automaticamente.

## Pendencies

- Deploy com docker compose no Heroku.

## References for Credits 👍

- Youtube: [Live Coding](https://www.youtube.com/watch?v=MOpwfg1GJig)
- Forked from: [ErickWendel/docker-secrets-meme-maker](https://github.com/ErickWendel/docker-secrets-meme-maker)

## References for Studies 📖

- [suporte-a-docker-no-linux-via-snap](https://www.edivaldobrito.com.br/suporte-a-docker-no-linux-via-snap)

## To Research ⁉️

- Node.js Streams???
- Na [#SemanaJS Expert](https://javascriptexpert.com.br/) será realizado um projeto que demanda **processamento de audio em tempo real**, por isso será necessário usar um **binário do SO**, para por exemplo: juntar audios, ajustar volume, adicionar efeitos, etc. A utilização do docker é importante, pois os alunos não tem todos o meio ambiente.
- Docker, multi stage building?? Diminuir o tamanho da imagem.
