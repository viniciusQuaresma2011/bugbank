*** Settings ***

Resource      ../../base/Base.robot

*** Variables ***


${input_email_cadastro}     //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/div[2]/input[1]
${input_email}    //*[@id="__next"]/div[1]/div[2]/div[1]/div[1]/form[1]/div[1]/input[1]

${input_nome_cadastro}      //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/div[3]/input[1]

${input_senha}    //*[@id="__next"]/div/div[2]/div/div[1]/form/div[2]/div/input
${input_senha_cadastro}   //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/div[4]/div[1]/input[1]

${input_senha_confirmacao_cadastro}     //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/div[5]/div[1]/input[1]
${botao_cadastrar_pg_cadastro}          //*[@id="__next"]/div[1]/div[2]/div[1]/div[2]/form[1]/button[1]


${botao_fechar_card}    //*[@id="btnCloseModal"]

${botao_acessar}    //*[@id="__next"]/div[1]/div[2]/div[1]/div[1]/form[1]/div[3]/button[1]
${botao_card_erro_login}    //*[@id="btnCloseModal"]

${verifica_usuario_logado}    //*[@id="textName"]
${usuario}             Olá a1,


${verifica_mensagem_erro}    //*[@id="login_button_container"]/div[1]/form[1]/div[3]/h3
${mensagem_erro}             Epic sadface: Sorry, this user has been locked out.

${mensagem_campo_email_obrigatorio}     //*[@id="__next"]/div[1]/div[2]/div[1]/div[1]/form[1]/div[1]/p[1]    
${mensagem_campo_senha_obrigatorio}     //*[@id="__next"]/div[1]/div[2]/div[1]/div[1]/form[1]/div[2]/div[1]/p[1]



*** Keywords ***
Dado que estou na pagina de Login do BugBank
    Open Browser    ${URL}    Edge

E preencho o campo Email com "${email}"
    Clear Element Text  ${input_email}
    
    Input Text    ${input_email}    ${email}

E preencho o campo Senha com "${senha}"
    Clear Element Text  ${input_senha} 
    
    Input Text    ${input_senha}    ${senha}

Quando clico no botao Acessar
    Wait Until Element Is Visible       ${botao_acessar}
    Click Element    ${botao_acessar}

Quando clico no botao Acessar a pagina de login
    Wait Until Element Is Visible       ${botao_card_erro_login}
    Click Element   ${botao_card_erro_login}

Entao consigo entrar no sistema com sucesso com o nome ${nome_usuario}!!!
    Wait Until Element Is Visible   ${verifica_usuario_logado} 
    ${usuario_logado}    Get Text     ${verifica_usuario_logado}
    Should Contain            ${nome_usuario}    ${usuario_logado}
    # Sleep   15s


Verifica Mensagem Input Email
    ${mensagem_email}   Get Text    ${mensagem_campo_email_obrigatorio}
    Should Be Equal     É campo obrigatório     ${mensagem_email}


Verifica Mensagem Input Senha
    ${mensagem_senha}   Get Text    ${mensagem_campo_senha_obrigatorio}
    Should Be Equal     É campo obrigatório     ${mensagem_senha}
