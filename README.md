# bugbank
Projeto de automação Web realizado em um banco com "bugs" utilizando Robot Framework(Scripts) + Selenium e os Cenários em Gherkin

ATENÇÃO -> Projeto configurado para rodar em Container Docker:D

1º Passo: Clonar o projeto -> Branch: master

git clone https://github.com/viniciusQuaresma2011/bugbank.git

2º Passo: Entrar na pasta do projeto

cd bugbank

3º Passo: Crie uma imagem docker

docker build -t teste .

4º Passo: Execute o comando para rodar o teste

docker run --user=nonroot -v ${PWD}\output:/output teste

5º Passo: acesse a pasta output e veja o resultado dos testes.
