FROM aarto/selenium:4.0.0

ARG NODE_RELEASE

RUN apt-get -y update && \
    apt-get -y install curl sudo git jq gnupg2

RUN wget https://nodejs.org/dist/v${NODE_RELEASE}/node-v${NODE_RELEASE}-linux-x64.tar.gz && \
    tar -xvf node-v${NODE_RELEASE}-linux-x64.tar.gz -C /usr/local/lib && \
    ln -s /usr/local/lib/node-v${NODE_RELEASE}-linux-x64/bin/node /usr/bin/node && \
    ln -s /usr/local/lib/node-v${NODE_RELEASE}-linux-x64/bin/npm /usr/bin/npm && \
    ln -s /usr/local/lib/node-v${NODE_RELEASE}-linux-x64/bin/npx /usr/bin/npx

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    apt-get -y update && \
    apt-get -y install --no-install-recommends yarn && \
    yarn --version

RUN rm -rf \ 
        node-v${NODE_RELEASE}-linux-x64.tar.gz \
        /var/lib/apt/lists/*
