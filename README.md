# docker-secrets-meme-maker 🥇

Meme generator with Docker and JavaScript! :adult:

Fizemos uma configuração especial para rodar o **nodemon** que consiste em separar as pastas do código JS da pasta node_modules, para restartar corretamente.

## Requeriments ✅

- [Node](https://nodejs.org/en/)
- [Docker](https://www.docker.com) OR [Graphicsmagick](http://www.graphicsmagick.org/index.html)
- [npmjs.com/package/@erickwendel/meme-maker](https://www.npmjs.com/package/@erickwendel/meme-maker)

**OBS:** Se usar Docker não será necessário instalar o **Graphicsmagick** na própria máquina, mas somente no container.

## Docker

1. Defina o ambiente do app com um [Dockerfile](https://docs.docker.com/engine/reference/builder) para que ele possa ser reproduzido em qualquer lugar.

2. Defina os serviços que compõem o app [docker-compose.yml](https://docs.docker.com/compose) para que possam ser executados juntos em um ambiente isolado.

3. Execute o comando **docker compose up** para inicializar a app. Na primeira vez use o argumento **--build** para a construção do ambiente. Também pode executar este comando usando o binário docker-compose.

- Quando usamos **volume**, pegamos o ambiente do docker e espelhamos ele na nossa máquina.
  
  Exemplo, rodar um comando do imagemagick dentro do container do compose.
  
    `docker ps`

    **-it** é o modo iterativo.
    **docker-secrets-meme-maker_meme-maker_1** é nome da imagem.
    **bash** é como se estivesse acessando via ssh

    `docker exec -it docker-secrets-meme-maker_meme-maker_1 bash`

    Com isso validamos se está tudo certo com o ambiente.
    /meme-generators$

    `gm -version`

    Este comando mostra a versão do GraphicsMagick e informações...
    Isso mostra que dentro do container está tudo OK.

    `ls`
    `gm -convert "img/sorry.jpg" -monochrome sorry.jpg`

    De dentro do container, sem ter o gm instalado na máquina.
    Ele copiou a imagem de dentro da pasta img para a pasta raiz da app.

## Run project locally 🚧

`git clone git@github.com:heviane/docker-secrets-meme-maker.git`

`cd docker-secrets-meme-maker`

`npm init` OR `npm install`

`npm install @erickwendel/meme-maker`

`sudo snap install docker` OR `sudo apt install docker-compose`

Executar com o argumento **--build** somente na primeira vez para a construção:

`sudo docker-compose up --build`

## Como funciona a app

No index.js configuramos a imagem de entrada e a imagem de saída, e alteramos as configurações que queremos, por exemplo, o texto que deve aparecer na imagem, aí executamos o arquivo e ele atualiza a imagem de saída com o novo texto configurado.

Como estamos usando o **nodemon** não precisamos executar novamente, a cada modificação salva no arquivo a app é restartada pelo nodemon de forma automática.

## Pendencies

- Como fazer o deploy de uma app que tem o docker compose no Heroku. Assim poderemos executar a app nos executáveis que quisermos.
- gm é o **GraphicsMagick** é uma biblioteca multiplataforma para edição de imagens. Aqui nesta app, usamos para colocar as letras, mas dá para fazer muito mais.
- Docker, multi stage building ?? Consegue diminuir o tamanho dele

## References 👍

- [Live Coding](https://www.youtube.com/watch?v=MOpwfg1GJig)
- [Github repository](https://github.com/ErickWendel/docker-secrets-meme-maker)
- [suporte-a-docker-no-linux-via-snap](https://www.edivaldobrito.com.br/suporte-a-docker-no-linux-via-snap)

- #SemanaJS Expert.

Iremos trabalhar com processamento de audio em tempo real, vamos precisar usar um binário do SO, para juntar os audios, ajustar volume, adicionar efeitos, etc. Por isso, precisamos do docker, pois os alunos não tem todos o meio ambiente.

Node.js Streams ???
