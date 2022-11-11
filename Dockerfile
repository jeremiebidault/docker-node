ARG SELENIUM_RELEASE

FROM aarto/selenium:${SELENIUM_RELEASE}

ARG NODE_RELEASE

ENV PATH=/usr/local/lib/node-v${NODE_RELEASE}-linux-x64/bin:${PATH}

# node
RUN wget -q https://nodejs.org/dist/v${NODE_RELEASE}/node-v${NODE_RELEASE}-linux-x64.tar.gz && \
    tar -xf node-v${NODE_RELEASE}-linux-x64.tar.gz -C /usr/local/lib || true && \
    rm -rf node-v${NODE_RELEASE}-linux-x64.tar.gz && \
    node --version

# yarn
RUN curl -sL https://dl.yarnpkg.com/debian/pubkey.gpg | gpg --dearmor -o /usr/share/keyrings/yarnkey.gpg && \
    echo "deb [signed-by=/usr/share/keyrings/yarnkey.gpg] https://dl.yarnpkg.com/debian stable main" > /etc/apt/sources.list.d/yarn.list && \
    apt-get update && \
    apt-get install -y \
        yarn

# cleanup
RUN rm -rf /var/lib/apt/lists/*
