FROM aarto/selenium:3.9.0

RUN apt-get -y update && \
    apt-get -y install curl sudo && \
    rm -rf /var/lib/apt/lists/*

RUN wget https://nodejs.org/dist/v14.11.0/node-v14.11.0-linux-x64.tar.gz && \
    tar -xvf node-v14.11.0-linux-x64.tar.gz -C /usr/local/lib && \
    ln -s /usr/local/lib/node-v14.11.0-linux-x64/bin/node /usr/bin/node && \
    ln -s /usr/local/lib/node-v14.11.0-linux-x64/bin/npm /usr/bin/npm && \
    ln -s /usr/local/lib/node-v14.11.0-linux-x64/bin/npx /usr/bin/npx

RUN rm -rf \
        node-v14.11.0-linux-x64.tar.gz

RUN curl -sS https://dl.yarnpkg.com/debian/pubkey.gpg | sudo apt-key add - && \
    echo "deb https://dl.yarnpkg.com/debian/ stable main" | sudo tee /etc/apt/sources.list.d/yarn.list && \
    apt-get -y update && \
    apt-get -y install --no-install-recommends yarn && \
    rm -rf /var/lib/apt/lists/* && \
    yarn --version

RUN yarn global add @angular/cli --prefix /usr && \
    ng --version
