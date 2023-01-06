*** Settings ***

Resource    ../../base/Base.robot


*** Variables ***
#Cadastro
${saldo_conta}      //*[@id="textBalance"]/span[1]
${input_email_cadastro}     //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/div[2]/input[1]
${input_nome_cadastro}      //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/div[3]/input[1]
${input_senha_cadastro}   //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/div[4]/div[1]/input[1]
${input_senha_confirmacao_cadastro}     //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/div[5]/div[1]/input[1]

${botao_cadastrar}      //*[@id="__next"]/div[1]/div[2]/div[1]/div[1]/form[1]/div[3]/button[2]
${botao_fechar_card_cadastro}     //*[@id="btnCloseModal"]
${botao_cadastrar_pg_cadastro}          //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/button[1]
${botao_sair_conta}     //*[@id="btnExit"]

${mensagem_modal_cadastro}     //*[@id="modalText"]
                                                
${mensagem_input_email_invalido_cadastro}       //*[@id="__next"]/div/div[2]/div/div[2]/form/div[2]/p
${mensagem_input_senha_invalido_cadastro}       //*[@id="__next"]/div/div[2]/div/div[2]/form/div[4]/div/p
${mensagem_input_confirmar_senha_invalido_cadastro}       //*[@id="__next"]/div/div[2]/div/div[2]/form/div[5]/div/p


${opção_criar_com_saldo}    //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/div[6]/label[1]/span[1]
${opcao_teste_sap}      //*[@id="__next"]/div/div[2]/div/div[2]/form/div[6]/label

${usuario_numero_conta}   //*[@id="textAccountNumber"]/span[1]
*** Keywords ***
###### Keywords para Cadastro
Dado que estou na Tela de Cadastro do BugBank
    Abrir o Browser 
    Click Element   ${botao_cadastrar}

E preencho em cadastro o campo email com "${email}"
    Input Text    ${input_email_cadastro}    ${email}

E preencho em cadastro o campo nome com "${nome}"
    Input Text    ${input_nome_cadastro}    ${nome}

E preencho em cadastro o campo senha com "${senha}"
    Input Text    ${input_senha_cadastro}    ${senha}

E preencho em cadastro o campo Confirmar senha com "${senha}"
    Input Text    ${input_senha_confirmacao_cadastro}    ${senha}

Verifica em Cadastro a Mensagem Input Nome
    Wait Until Element Is Visible       ${mensagem_modal_cadastro} 
    ${mensagem_nome_cadastro}   Get Text    ${mensagem_modal_cadastro}
    Should Be Equal     Nome não pode ser vazio.     ${mensagem_nome_cadastro}
    Wait Until Element Is Visible   ${botao_fechar_card_cadastro}
    Click Element   ${botao_fechar_card_cadastro}

 

Verifica em Cadastro a Mensagem Input Email Nulo
    Wait Until Element Is Visible       ${mensagem_input_email_invalido_cadastro}
    ${mensagem_email_cadastro}   Get Text    ${mensagem_input_email_invalido_cadastro}
    Should Be Equal     É campo obrigatório     ${mensagem_email_cadastro}
    

Verifica em Cadastro Mensagem Input Email inválido  
    Wait Until Element Is Visible       ${mensagem_input_email_invalido_cadastro}
    ${mensagem_email_cadastro_invalido}   Get Text    ${mensagem_input_email_invalido_cadastro}
    Should Be Equal     Formato inválido     ${mensagem_email_cadastro_invalido}
    
Verifica em Cadastro Mensagem Input Senha nula
    Wait Until Element Is Visible       ${mensagem_input_senha_invalido_cadastro}
    ${mensagem_senha_cadastro}   Get Text    ${mensagem_input_senha_invalido_cadastro}
    Should Be Equal     É campo obrigatório     ${mensagem_senha_cadastro}

Verifica em Cadastro Mensagem Input Confirmar Senha nula
    Wait Until Element Is Visible       ${mensagem_input_confirmar_senha_invalido_cadastro}
    ${mensagem_confirmar_senha_cadastro}   Get Text    ${mensagem_input_confirmar_senha_invalido_cadastro}
    Should Be Equal     É campo obrigatório     ${mensagem_confirmar_senha_cadastro}

E marco a opção Criar conta com Saldo
    Wait Until Element Is Visible   ${opção_criar_com_saldo}
    Click Element   ${opção_criar_com_saldo}
    Sleep   5s
        


E não marco a opção Criar conta com Saldo
    Double Click Element   ${opção_criar_com_saldo}

Verifico se o Saldo corresponde a "${saldo_conta_opcao_marcada}"
    Wait Until Element Is Visible   ${saldo_conta}
    ${consulta_saldo_conta}     Get Text    ${saldo_conta}
    Should Be Equal     ${saldo_conta_opcao_marcada}      ${consulta_saldo_conta}

Verifica se o Número da conta é exibido
    ${possui_numero_conta}      Get Text    ${mensagem_modal_cadastro}
    Should Contain      A conta 533-2 foi criada com sucesso      ${possui_numero_conta}

Verifico se a Senha e Confirmar Senha estão DIFERENTES
    Wait Until Element Is Visible       ${mensagem_modal_cadastro}
    ${mensagem_senha_confirmar_senha_diferentes}    Get Text    ${mensagem_modal_cadastro}
    Should Be Equal     As senhas não são iguais.       ${mensagem_senha_confirmar_senha_diferentes}

Quando clico em Cadastrar
    Click Element   ${botao_cadastrar_pg_cadastro}

Aguardo "${tempo_sleep}" segundos
    Sleep   ${tempo_sleep}

Clico para Sair e retornar para o cadastro
    Click Element   ${botao_sair_conta}


Armazeno o Número da primeira conta aqui "${numero_conta_recebido}"
    ${primeira_conta_numero}    Get Text    ${usuario_numero_conta}
    Log     ${usuario_numero_conta}   

Entao sou cadastrado com sucesso!
    Wait Until Element Is Visible   ${botao_fechar_card_cadastro}
    
    Click Element   ${botao_fechar_card_cadastro}
   
   
Cadastrar rapido
    [Arguments]     ${email}    ${nome}     ${senha}    ${confirmar_senha}
    Open Browser    ${URL}    Edge
    Click Element   ${botao_cadastrar}
    Input Text    ${input_email_cadastro}    ${email}
    Input Text    ${input_nome_cadastro}    ${nome}
    Input Text    ${input_senha_cadastro}    ${senha}
    Input Text    ${input_senha_confirmacao_cadastro}    ${confirmar_senha}
    Click Element   ${botao_cadastrar_pg_cadastro}
    Wait Until Element Is Visible   ${botao_fechar_card_cadastro}
    
    Click Element   ${botao_fechar_card_cadastro} 

Cadastrar rapido Cenario Conta 2
    [Arguments]     ${email}    ${nome}     ${senha}    ${confirmar_senha}
    
    Click Element   ${botao_cadastrar}
    Input Text    ${input_email_cadastro}    ${email}
    Input Text    ${input_nome_cadastro}    ${nome}
    Input Text    ${input_senha_cadastro}    ${senha}
    Input Text    ${input_senha_confirmacao_cadastro}    ${confirmar_senha}
    Wait Until Element Is Visible   ${opção_criar_com_saldo}

    Click Element   ${opção_criar_com_saldo}
    Wait Until Element Is Visible   ${opcao_teste_sap}
    Click Element   ${opcao_teste_sap}

    Click Element   ${botao_cadastrar_pg_cadastro}
    Wait Until Element Is Visible   ${botao_fechar_card_cadastro}
    
    Click Element   ${botao_fechar_card_cadastro} 
