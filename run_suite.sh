#!/bin/bash

# Iniciar o servidor Xvfb
Xvfb :99 -screen 0 1280x1024x24 &
export DISPLAY=:99

sleep 5

# Executar os testes do Robot Framework usando o Firefox
robot --variable BROWSER:firefox /app/tests/resources/data/Cadastro/Cadastro.robot
