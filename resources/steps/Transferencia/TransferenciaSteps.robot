*** Settings ***

Resource    ../../base/Base.robot


*** Variables ***





${saldo_conta}      //*[@id="textBalance"]/span[1]
${saldo_conta_span}     //*[@id="textBalance"]/span     

${botao_sair_conta}     //*[@id="btnExit"]

${botao_transferencia}      //*[@id="btn-TRANSFERÊNCIA"]/span/img

${input_numero_conta}       //*[@id="__next"]/div/div[3]/form/div[1]/div[1]/input

${input_digito_conta}     //*[@id="__next"]/div/div[3]/form/div[1]/div[2]/input

${input_valor_transferencia_conta}       //*[@id="__next"]/div/div[3]/form/div[2]/input

${input_descricao_conta}        //*[@id="__next"]/div/div[3]/form/div[3]/input
${botao_fechar_card}     //*[@id="btnCloseModal"]

${botão_transferir}     //*[@id="__next"]/div/div[3]/form/button
${label_mensagem_conta}     //*[@id="modalText"]       


${usuario_numero_conta}   //*[@id="textAccountNumber"]/span[1]

#${saldo_conta_restante}     //*[@id="textBalanceAvailable"]

${botao_voltar_consulta_saldo}      //*[@id="btnBack"]

*** Keywords ***

E clico em Transferencia
    Click Element   ${botao_transferencia}

E preencho o Numero da conta com o dado "${numero_conta}"
    Wait Until Element Is Visible   ${input_numero_conta}
    Input Text      ${input_numero_conta}       ${numero_conta}

E preencho o Digito da conta com o dado "${input_digito}"
    Wait Until Element Is Visible   ${input_digito_conta}
    Input Text      ${input_digito_conta}       ${input_digito}


E preencho o Valor da Transferencia com o dado "${valor_transferencia}"
    Wait Until Element Is Visible   ${input_valor_transferencia_conta}
    Input Text  ${input_valor_transferencia_conta}      ${valor_transferencia}


E preencho a Descrição com o dado "${descricao_conta}"
    Wait Until Element Is Visible       ${input_descricao_conta}
    Input Text  ${input_descricao_conta}        ${descricao_conta}

Quando clico para Transferir
    Wait Until Element Is Visible       ${botão_transferir}
    Click Element       ${botão_transferir}

Verifico se deu certo a Transferencia entre as contas
    Wait Until Element Is Visible       ${label_mensagem_conta}
    ${mensagem_conta}    Get Text      ${label_mensagem_conta}
    Should Be Equal      Transferencia realizada com sucesso        ${mensagem_conta}


Consulto o saldo restante de "${saldo_restante}"
    Wait Until Element Is Visible   ${botao_fechar_card}
    
    Click Element   ${botao_fechar_card}

    Wait Until Element Is Visible   ${botao_voltar_consulta_saldo}
    Click Element   ${botao_voltar_consulta_saldo}
    Wait Until Element Is Visible       ${saldo_conta_span}
    ${saldo_balanco}     Get Text    ${saldo_conta_span}
    Should Be Equal     ${saldo_restante}      ${saldo_balanco}   

Erro ao Transferir saldo insuficiente
    Fail    Você não possui saldo suficiente!

Erro ao Transferir conta inválida
    Fail    Conta inválida!

Erro ao Transferir
    Fail    Valor de transferência não pode ser igual ou menor que zero

Verifico se Retorna a pagina de Extrato
    Fail    Não retornou para a pagina de extrato da conta


