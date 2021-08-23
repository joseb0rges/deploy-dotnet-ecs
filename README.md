O sistema deve conter:
- Aplicação Backend utilizando o framework .Net Core 3.1 que já está pronta neste repositório
- Postgresql como banco de dados da aplicação
- Serviço para fazer o Proxy Reverso para a porta 80 (Ex. Nginx)

O comportamento esperado da aplicação é a exibição dos valores que serão inseridos no banco durante a inicialização do Backend, quando for requisitado no endereço raiz da porta 80.

### Deploy the ECS cluster
Acesse o diretorio iac/

terraform init <br/>
terraform plan <br/>
terraform apply



