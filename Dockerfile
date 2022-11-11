ARG SELENIUM_RELEASE

FROM aarto/selenium:${SELENIUM_RELEASE}

WORKDIR /

ENV NVM_DIR=/.nvm

# nvm
RUN mkdir /.nvm && \
    curl -sL https://raw.githubusercontent.com/nvm-sh/nvm/v0.39.2/install.sh | bash && \
    . /.nvm/nvm.sh && \
    nvm install 16 && \
    nvm install 18

# yarn
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarnkey.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" > /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y \
        yarn

# cleanup
RUN rm -rf /var/lib/apt/lists/*
