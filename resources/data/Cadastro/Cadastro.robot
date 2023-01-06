*** Settings ***
Documentation       Testando a pagina Cadastro



Resource    ../../base/Base.robot
Resource    ../../steps/Cadastro/CadastroSteps.robot
Resource    ../../steps/Login/LoginSteps.robot
Suite Teardown   Close All Browsers

*** Test Cases ***

# Nome 
Cenário 1 - Cadastrar com Nome válido
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    Entao sou cadastrado com sucesso!
    Fechar o browser    

Cenário 2 - Cadastrar com Nome inválido
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "@#%$!#%@$@#$"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    #Verifica Mensagem Input Nome
    Entao sou cadastrado com sucesso!
    Fechar o browser   

Cenário 3 - Cadastrar com Nome nulo
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com ""
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    Verifica em Cadastro a Mensagem Input Nome
    Entao sou cadastrado com sucesso!
    




######################################################################


# Email 
Cenário 1 - Cadastrar com E-mail válido
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    Entao sou cadastrado com sucesso!
    Fechar o browser 

Cenário 2 - Cadastrar com E-mail inválido
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "#!@$!@#@78@382$@&#*haudh"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    Verifica em Cadastro Mensagem Input Email inválido 
    Entao sou cadastrado com sucesso!
    Fechar o browser 

Cenário 3 - Cadastrar com E-mail nulo
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com ""
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    Verifica em Cadastro a Mensagem Input Email Nulo
    Entao sou cadastrado com sucesso!
    Fechar o browser 



######################################################################



# Senha 
Cenário 1 - Cadastrar com Senha válida
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    Entao sou cadastrado com sucesso!
    Fechar o browser 

Cenário 2 - Cadastrar com Senha nula
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com ""
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    Verifica em Cadastro Mensagem Input Senha nula 
    Entao sou cadastrado com sucesso!
    Fechar o browser 

######################################################################


# Confirmar Senha 
Cenário 1 - Cadastrar com o campo Confirmar Senha válida
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    Entao sou cadastrado com sucesso!
    Fechar o browser 

Cenário 2 - Cadastrar com o campo Confirmar Senha nula
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com ""
    Quando clico em Cadastrar
    Verifica em Cadastro Mensagem Input Confirmar Senha nula 
    Entao sou cadastrado com sucesso!
    Fechar o browser 


Cenário 3 - Cadastrar com o campo Senha e Confirmar Senha com dados IGUAIS
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    Quando clico em Cadastrar
    Entao sou cadastrado com sucesso!
     

Cenário 4 - Cadastrar com o campo Senha e Confirmar Senha com dados DIFERENTES
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "654321"
    Quando clico em Cadastrar
    Verifico se a Senha e Confirmar Senha estão DIFERENTES
    Entao consigo entrar no sistema com sucesso com o nome "a1"!!!
    # Fechar o browser


######################################################################


# Criar conta com saldo 
Cenário 1 - Cadastrar com a opção Criar conta com saldo marcada
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    E marco a opção Criar conta com Saldo
    Quando clico em Cadastrar
    Entao sou cadastrado com sucesso!
    E preencho o campo Email com "a1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Verifico se o Saldo corresponde a "R$ 1.000,00"
    Fechar o browser 

#sem saldo
Cenário 2 - Cadastrar sem a opção Criar conta com saldo marcada
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    E não marco a opção Criar conta com Saldo
    Quando clico em Cadastrar
    Entao sou cadastrado com sucesso!
    E preencho o campo Email com "a1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Verifico se o Saldo corresponde a "R$ 0,00"
    Fechar o browser 

######################################################################


## Cadastrar conta com sucesso deve exibir número da conta criada
Cenário 1 - Cadastrar uma conta com saldo marcada e exibir o numero da conta
    Dado que estou na Tela de Cadastro do BugBank
    E preencho em cadastro o campo email com "a1@gmail.com"
    E preencho em cadastro o campo nome com "a1"
    E preencho em cadastro o campo senha com "123456"
    E preencho em cadastro o campo Confirmar senha com "123456"
    E marco a opção Criar conta com Saldo
    Quando clico em Cadastrar
    Verifica se o Número da conta é exibido
    # Entao sou cadastrado com sucesso!
    # E preencho o campo Email com "a1@gmail.com"
    # E preencho o campo Senha com "123456"
    # Quando clico no botao Acessar
    # Verifico se o Saldo corresponde a "R$ 1.000,00"
    # Fechar o browser 