*** Settings ***
Documentation       Testando a pagina Transferencia




Resource    ../../base/Base.robot
Resource    ../../steps/Cadastro/CadastroSteps.robot
Resource    ../../steps/login/LoginSteps.robot
Resource    ../../steps/Transferencia/TransferenciaSteps.robot
Suite Teardown   Close All Browsers

*** Variables ***
${usuario_numero_conta}   //*[@id="textAccountNumber"]/span[1]
${usuario_saldo_conta}    //*[@id="textBalance"]/span[1]

${mensagem_card_transferencia}      //*[@id="modalText"]

*** Test Cases ***

# Transferencia entre contas
Cenário 1 - Realizar Transferencia de R$ 100,00 para uma conta Válida
    # Primeira conta
    Cadastrar rapido    conta1@gmail.com    conta1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta1,"!!!!
    #Armazeno o Número da primeira conta
    ${numero_conta}   Get Text    ${usuario_numero_conta}
    ${numero_conta_sem_digito}      Evaluate    "${numero_conta}".split("-")[0]
    ${digito_conta}     Evaluate    "${numero_conta}".split("-")[1]    
    Clico para Sair e retornar para o cadastro
    
    #Segunda conta
    Cadastrar rapido Cenario Conta 2    conta2@gmail.com    conta2    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta2@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta2,"!!!!
    #Verifico o saldo disponivel na conta
    ${saldo_conta}  Get Text     ${usuario_saldo_conta}
    ${saldo_editado}    Remove String     ${saldo_conta}    R$   .    ,00
    
    Log     ${saldo_editado}
    IF    ${saldo_editado} >= 100
        E clico em Transferencia
        E preencho o Numero da conta com o dado "${numero_conta_sem_digito}"
        E preencho o Digito da conta com o dado "${digito_conta}"
        E preencho o Valor da Transferencia com o dado "100"
        E preencho a Descrição com o dado "Transferencia para fulano de tal"
        Quando clico para Transferir
        Verifico se deu certo a Transferencia entre as contas
        Aguardo "5s" segundos
    
    ELSE IF  ${saldo_editado} <= 100
        Erro ao Transferir saldo insuficiente
    END
    

# Transferencia entre contas - CONTA INVÀLIDA
Cenário 2 - Realizar Transferencia de R$ 100,00 para uma conta inválida
    # Primeira conta
    Cadastrar rapido    conta1@gmail.com    conta1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta1,"!!!!
    #Armazeno o Número da primeira conta
    ${numero_conta}   Get Text    ${usuario_numero_conta}
    ${numero_conta_sem_digito}      Evaluate    "${numero_conta}".split("-")[0]
    ${digito_conta}     Evaluate    "${numero_conta}".split("-")[1]    
    Clico para Sair e retornar para o cadastro
    
    #Segunda conta
    Cadastrar rapido Cenario Conta 2    conta2@gmail.com    conta2    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta2@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta2,"!!!!
    #Verifico o saldo disponivel na conta
    ${saldo_conta}  Get Text     ${usuario_saldo_conta}
    ${saldo_editado}    Remove String     ${saldo_conta}    R$   .    ,00
    
    Log     ${saldo_editado}
    
    E clico em Transferencia
    E preencho o Numero da conta com o dado "@#$%@#"
    E preencho o Digito da conta com o dado "@#"
    E preencho o Valor da Transferencia com o dado "100"
    E preencho a Descrição com o dado "Transferencia para fulano de tal"
    Quando clico para Transferir
    ${mensagem_card}    Get Text    ${mensagem_card_transferencia}
    IF  "${mensagem_card}" == "Conta inválida ou inexistente"
        Erro ao Transferir conta inválida
    END
    Verifico se deu certo a Transferencia entre as contas
    Aguardo "5s" segundos


#Numero e Digito apenas NUMERO
Cenário 3 - Realizar Transferencia para uma conta Apenas Numero
    # Primeira conta
    Cadastrar rapido    conta1@gmail.com    conta1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta1,"!!!!
    #Armazeno o Número da primeira conta
    ${numero_conta}   Get Text    ${usuario_numero_conta}
    ${numero_conta_sem_digito}      Evaluate    "${numero_conta}".split("-")[0]
    ${digito_conta}     Evaluate    "${numero_conta}".split("-")[1]    
    Clico para Sair e retornar para o cadastro
    
    #Segunda conta
    Cadastrar rapido Cenario Conta 2    conta2@gmail.com    conta2    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta2@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta2,"!!!!
    #Verifico o saldo disponivel na conta
    ${saldo_conta}  Get Text     ${usuario_saldo_conta}
    ${saldo_editado}    Remove String     ${saldo_conta}    R$   .    ,00
    
    Log     ${saldo_editado}
    
    E clico em Transferencia
    E preencho o Numero da conta com o dado "${numero_conta_sem_digito}"
    E preencho o Digito da conta com o dado "${digito_conta}"
    E preencho o Valor da Transferencia com o dado "100"
    E preencho a Descrição com o dado "Transferencia para fulano de tal"
    Quando clico para Transferir
    Verifico se deu certo a Transferencia entre as contas
    Aguardo "5s" segundos
    
    
#Numero e Digito apenas String
Cenário 4 - Realizar Transferencia para uma conta Apenas STRING
    # Primeira conta
    Cadastrar rapido    conta1@gmail.com    conta1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta1,"!!!!
    #Armazeno o Número da primeira conta
    ${numero_conta}   Get Text    ${usuario_numero_conta}
    ${numero_conta_sem_digito}      Evaluate    "${numero_conta}".split("-")[0]
    ${digito_conta}     Evaluate    "${numero_conta}".split("-")[1]    
    Clico para Sair e retornar para o cadastro
    
    #Segunda conta
    Cadastrar rapido Cenario Conta 2    conta2@gmail.com    conta2    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta2@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta2,"!!!!
    #Verifico o saldo disponivel na conta
    ${saldo_conta}  Get Text     ${usuario_saldo_conta}
    ${saldo_editado}    Remove String     ${saldo_conta}    R$   .    ,00
    
    Log     ${saldo_editado}
    
    E clico em Transferencia
    E preencho o Numero da conta com o dado "ASDFG"
    E preencho o Digito da conta com o dado "ASD"
    E preencho o Valor da Transferencia com o dado "100"
    E preencho a Descrição com o dado "Transferencia para fulano de tal"
    Quando clico para Transferir
    Verifico se deu certo a Transferencia entre as contas
    Aguardo "5s" segundos


#Campo Descrição preenchido
Cenário 5 - Realizar Transferencia com o campo Descrição Preenchido
    # Primeira conta
    Cadastrar rapido    conta1@gmail.com    conta1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta1,"!!!!
    #Armazeno o Número da primeira conta
    ${numero_conta}   Get Text    ${usuario_numero_conta}
    ${numero_conta_sem_digito}      Evaluate    "${numero_conta}".split("-")[0]
    ${digito_conta}     Evaluate    "${numero_conta}".split("-")[1]    
    Clico para Sair e retornar para o cadastro
    
    #Segunda conta
    Cadastrar rapido Cenario Conta 2    conta2@gmail.com    conta2    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta2@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta2,"!!!!
    #Verifico o saldo disponivel na conta
    ${saldo_conta}  Get Text     ${usuario_saldo_conta}
    ${saldo_editado}    Remove String     ${saldo_conta}    R$   .    ,00
    
    Log     ${saldo_editado}
    
    E clico em Transferencia
    E preencho o Numero da conta com o dado "${numero_conta_sem_digito}"
    E preencho o Digito da conta com o dado "${digito_conta}"
    E preencho o Valor da Transferencia com o dado "100"
    E preencho a Descrição com o dado "Transferencia para fulano de tal"
    Quando clico para Transferir
    Verifico se deu certo a Transferencia entre as contas
    Aguardo "5s" segundos

#Campo Descrição nulo
Cenário 6 - Realizar Transferencia com campo Descrição Nulo
    # Primeira conta
    Cadastrar rapido    conta1@gmail.com    conta1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta1,"!!!!
    #Armazeno o Número da primeira conta
    ${numero_conta}   Get Text    ${usuario_numero_conta}
    ${numero_conta_sem_digito}      Evaluate    "${numero_conta}".split("-")[0]
    ${digito_conta}     Evaluate    "${numero_conta}".split("-")[1]    
    Clico para Sair e retornar para o cadastro
    
    #Segunda conta
    Cadastrar rapido Cenario Conta 2    conta2@gmail.com    conta2    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta2@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta2,"!!!!
    #Verifico o saldo disponivel na conta
    ${saldo_conta}  Get Text     ${usuario_saldo_conta}
    ${saldo_editado}    Remove String     ${saldo_conta}    R$   .    ,00
    
    Log     ${saldo_editado}
    
    E clico em Transferencia
    E preencho o Numero da conta com o dado "${numero_conta_sem_digito}"
    E preencho o Digito da conta com o dado "${digito_conta}"
    E preencho o Valor da Transferencia com o dado "100"
    E preencho a Descrição com o dado ""
    Quando clico para Transferir
    Verifico se deu certo a Transferencia entre as contas
    Aguardo "5s" segundos


Cenário 7 - Valor de transferência não pode ser igual ou menor que zero
    # Primeira conta
    Cadastrar rapido    conta1@gmail.com    conta1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta1,"!!!!
    #Armazeno o Número da primeira conta
    ${numero_conta}   Get Text    ${usuario_numero_conta}
    ${numero_conta_sem_digito}      Evaluate    "${numero_conta}".split("-")[0]
    ${digito_conta}     Evaluate    "${numero_conta}".split("-")[1]    
    Clico para Sair e retornar para o cadastro
    
    #Segunda conta
    Cadastrar rapido Cenario Conta 2    conta2@gmail.com    conta2    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta2@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta2,"!!!!
    #Verifico o saldo disponivel na conta
    ${saldo_conta}  Get Text     ${usuario_saldo_conta}
    ${saldo_editado}    Remove String     ${saldo_conta}    R$   .    ,00
    
    Log     ${saldo_editado}
    
    IF    100 <= 0
        Erro ao Transferir
    ELSE    
        E clico em Transferencia
        E preencho o Numero da conta com o dado "${numero_conta_sem_digito}"
        E preencho o Digito da conta com o dado "${digito_conta}"
        E preencho o Valor da Transferencia com o dado "100"
        E preencho a Descrição com o dado ""
        Quando clico para Transferir
        Verifico se deu certo a Transferencia entre as contas
        Aguardo "5s" segundos
    END


Cenário 8 - Ao realizar transferência com sucesso deve ser debitado o valor da conta e exibir a mensagem de 'Transferência realizada com sucesso'
    # Primeira conta
    Cadastrar rapido    conta1@gmail.com    conta1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta1,"!!!!
    #Armazeno o Número da primeira conta
    ${numero_conta}   Get Text    ${usuario_numero_conta}
    ${numero_conta_sem_digito}      Evaluate    "${numero_conta}".split("-")[0]
    ${digito_conta}     Evaluate    "${numero_conta}".split("-")[1]    
    Clico para Sair e retornar para o cadastro
    
    #Segunda conta
    Cadastrar rapido Cenario Conta 2    conta2@gmail.com    conta2    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta2@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta2,"!!!!
    #Verifico o saldo disponivel na conta
    ${saldo_conta}  Get Text     ${usuario_saldo_conta}
    ${saldo_editado}    Remove String     ${saldo_conta}    R$   .    ,00
    
    Log     ${saldo_editado}
    
  
    E clico em Transferencia
    E preencho o Numero da conta com o dado "${numero_conta_sem_digito}"
    E preencho o Digito da conta com o dado "${digito_conta}"
    E preencho o Valor da Transferencia com o dado "100"
    E preencho a Descrição com o dado ""
    Quando clico para Transferir
    Verifico se deu certo a Transferencia entre as contas
    Sleep   5s
    Consulto o saldo restante de "R$ 900,00"
   


Cenário 9 - Ao realizar uma transferência com sucesso deve ser redirecionado para o extrato
    # Primeira conta
    Cadastrar rapido    conta1@gmail.com    conta1    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta1@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta1,"!!!!
    #Armazeno o Número da primeira conta
    ${numero_conta}   Get Text    ${usuario_numero_conta}
    ${numero_conta_sem_digito}      Evaluate    "${numero_conta}".split("-")[0]
    ${digito_conta}     Evaluate    "${numero_conta}".split("-")[1]    
    Clico para Sair e retornar para o cadastro
    
    #Segunda conta
    Cadastrar rapido Cenario Conta 2    conta2@gmail.com    conta2    123456  123456
    #Dado que estou na pagina de Login do BugBank
    E preencho o campo Email com "conta2@gmail.com"
    E preencho o campo Senha com "123456"
    Quando clico no botao Acessar
    Entao consigo entrar no sistema com sucesso com o nome "Olá conta2,"!!!!
    #Verifico o saldo disponivel na conta
    ${saldo_conta}  Get Text     ${usuario_saldo_conta}
    ${saldo_editado}    Remove String     ${saldo_conta}    R$   .    ,00
    
    Log     ${saldo_editado}
    
  
    E clico em Transferencia
    E preencho o Numero da conta com o dado "${numero_conta_sem_digito}"
    E preencho o Digito da conta com o dado "${digito_conta}"
    E preencho o Valor da Transferencia com o dado "100"
    E preencho a Descrição com o dado ""
    Quando clico para Transferir
    Verifico se deu certo a Transferencia entre as contas
    Verifico se Retorna a pagina de Extrato
   