*** Settings ***
Documentation       Testando a pagina login



Resource    ../../base/Base.robot
Resource    ../../steps/Cadastro/CadastroSteps.robot
Resource    ../../steps/Login/LoginSteps.robot

Suite Teardown   Close All Browsers

*** Test Cases ***

# Email 
Cenário 1 - Realizar Login com E-mail válido
    Cadastrar rapido    a1@gmail.com    a1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "a1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá a1,"!!!!
    Fechar o browser

Cenário 2 - Realizar Login com E-mail inválido
    Cadastrar rapido    a1@#@%@#$.%@#$com    a1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "a1@#@%@#$.%@#$com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá a1,"!!!!
    Fechar o browser

Cenário 3 - Realizar Login com E-mail nulo
    Cadastrar rapido    a1@gmail.com    a1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com ""
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Verifica Mensagem Input Email
    Entao consigo entrar no sistema com sucesso com o nome "Olá a1,"!!!!
    Fechar o browser



######################################################################


# Senha 
Cenário 1 - Realizar Login com a Senha nula
    Cadastrar rapido    a1@gmail.com    a1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "a1@gmail.com"
    E preencho o campo Senha com ""
    Quando clico no botao Acessar
    Verifica Mensagem Input Senha
    Entao consigo entrar no sistema com sucesso com o nome "Olá a1,"!!!!
    Fechar o browser


# Email e Senha nulos
Cenário 1 - Realizar Login com Email e Senha nulos
    Cadastrar rapido    a1@gmail.com    a1    123456  123456
    #Dado que estou na pagina de Login do Swag Labs
    E preencho o campo Email com ""
    E preencho o campo Senha com ""
    Quando clico no botao Acessar
    Verifica Mensagem Input Email
    Verifica Mensagem Input Senha
    Entao consigo entrar no sistema com sucesso com o nome "Olá a1,"!!!!
    Fechar o browser
########################################################



