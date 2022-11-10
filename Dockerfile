ARG SELENIUM_RELEASE

FROM aarto/selenium:${SELENIUM_RELEASE}

SHELL ["/bin/bash", "-c"]

RUN apt-get -y update && \
    apt-get -y install \
        gnupg2 \
        git

RUN wget -qO- https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash && \
    source ~/.nvm/nvm.sh && \
    nvm install 16 && \
    nvm install 18 && \
    nvm alias default 16

RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarnkey.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" | tee /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y \
        yarn

RUN rm -rf /var/lib/apt/lists/*
