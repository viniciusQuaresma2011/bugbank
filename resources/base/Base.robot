*** Settings ***

Library    Selenium2Library
Library    String

*** Variables ***

${URL}    https://bugbank.netlify.app/



*** Keywords ***

Abrir o Browser
    Open Browser    ${URL}    Edge
Fechar o browser
    Close Browser



