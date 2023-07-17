*** Settings ***

Library    Selenium2Library
Library    String

*** Variables ***

${URL}    https://bugbank.netlify.app/



*** Keywords ***

Abrir o Browser
    Open Browser    ${URL}    Firefox
Fechar o browser
    Close Browser



