# hello-stone

## Como rodar o programa?

### Rodando localmente.
- ter o docker e docker-compose instalados.
- após clonar o repositório, navegue para a pasta *desafio-stone/hello-stone*
- execute o comando **docker-compose up**
- a aplicação estará disponível em localhost:8080

#### Detalhamento do processo.

### Rodando na AWS.

#### Detalhamento do processo.

you need permissions

- build image from dockerfile: docker image build ./hello-stone-app -t hello-stone-app

- create container from image: docker run -d -e PORT=8080 -p 8080:8080 --name hello-stone-app hello-stone-app

- after docker-compose: docker-compose up (optional tags)
