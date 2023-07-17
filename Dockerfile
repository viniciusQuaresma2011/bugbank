FROM python:3.9-buster

RUN useradd -m nonroot

USER root

RUN apt-get update \
    && apt-get install -y firefox-esr \
                          xvfb \
                          wget \
                          libglib2.0-0 \
                          libnss3 \
                          libgconf-2-4 \
                          libfontconfig1 \
                          libxrender1 \
                          libxtst6 \
                          xauth \
    && rm -rf /var/lib/apt/lists/*

RUN wget -q https://github.com/mozilla/geckodriver/releases/download/v0.30.0/geckodriver-v0.30.0-linux64.tar.gz \
    && tar -xzf geckodriver-v0.30.0-linux64.tar.gz \
    && rm geckodriver-v0.30.0-linux64.tar.gz \
    && mv geckodriver /usr/local/bin \
    && chmod +x /usr/local/bin/geckodriver

RUN pip install --no-cache-dir \
    robotframework==4.1.2 \
    robotframework-requests \
    robotframework-seleniumlibrary==5.1.3 \
    robotframework-xvfb \
    robotframework-selenium2library \
    robotframework-sshlibrary \
    cryptography \
    pyOpenSSL \
    idna \
    requests[security] \
    selenium==4.0.0

COPY run_suite.sh /scripts/run_suite.sh
COPY resources/base/Base.robot /app/tests/resources/base/Base.robot

COPY resources/data/Carrinho/Carrinho.robot /app/tests/resources/data/Carrinho/Carrinho.robot
COPY resources/data/Login/Login.robot /app/tests/resources/data/Login/Login.robot
COPY resources/data/Produto/Produto.robot /app/tests/resources/data/Produto/Produto.robot


COPY resources/steps/Carrinho/CarrinhoSteps.robot /app/tests/resources/steps/Carrinho/CarrinhoSteps.robot
COPY resources/steps/Login/LoginSteps.robot /app/tests/resources/steps/Login/LoginSteps.robot
COPY resources/steps/Produtos/ProdutosSteps.robot /app/tests/resources/steps/Produtos/ProdutosSteps.robot





USER nonroot

ENV MOZ_HEADLESS=1
ENV PATH="/usr/local/bin:${PATH}"
ENV GECKODRIVER_PATH="/usr/local/bin/geckodriver"
ENV ROBOT_OPTIONS="-d /output"
ENV ROBOT_EXIT_ON_FAILURE=1
ENV DISPLAY=:99

CMD ["/bin/bash", "/scripts/run_suite.sh"]
