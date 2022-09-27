# hello-stone

Uma aplicação simples em NodeJS para testar conhecimentos de deploy com Docker, Terraform e Ansible.

## Como rodar o programa?

### Rodando localmente.
- ter o docker e docker-compose instalados.
- após clonar o repositório, navegue para a pasta **desafio-stone/hello-stone**
- execute o comando **docker-compose up**
- a aplicação estará disponível em localhost:8080

### Rodando na AWS.
- possuir Terraform e Ansible instalados
- também no diretório **desafio-stone/hello-stone**, executar **terraform init**.
- em seguida, executar **terraform apply**
- a aplicação estará disponível no endereço exibido no terminal ao final da execução do Terraform, através do protocolo HTTP.

## Detalhamento do processo de desenvolvimento (passo a passo).

  O primeiro passo foi a criação de um Dockerfile, a partir do qual é gerada uma imagem Docker contendo toda a aplicação e suas dependências. Para gerar apenas a imagem, é possível rodar o comando:
  
  `docker image build ./hello-stone -t hello-stone`
  
  A partir dessa imagem, pode-se criar e executar o container, seguindo o comando abaixo:
  
  `docker run -d -e PORT=8080 -p 8080:8080 --name hello-stone hello-stone`
  
  Foi especificado que a execução da aplicação deveria ser tão automatizada quanto possível. Para isso, foi criado um arquivo docker-compose.yml que automatiza todos os passos anteriores, desde a build da imagem a partir do Dockerfile, até a definição de variáveis de ambiente e associação de portas. Essa ferramenta é especialmente útil ao lidar com mais de um container simultaneamente, quando a aplicação necessitar de tal.
  
  `docker-compose up`
  
  Com os passos detalhados, já é possível ter a aplicação rodando localmente. Para subir a infraestrutura na AWS e configurá-la, entretanto, utilizei ainda o Terraform e o Ansible. Os arquivos com extensão .tf detalham a infraestrutura a ser provisionada, no caso uma instância do tipo EC2 t2.micro com endereço de IP público e três security groups. O grupo responsável pelas conexões do tipo SSH foi configurado de forma a permitir que apenas a máquina que criou a instância seja capaz de se conectar a ela via SSH, então esse é um ponto de atenção.
  
  
