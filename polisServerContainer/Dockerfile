FROM ubuntu:16.04


RUN apt-get update && apt-get install -y git curl python-minimal build-essential postgresql-client libpq-dev

# Setup nvm
RUN mkdir -p /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10.9.0

RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH


# Copy and setup Polis Server
COPY polisServer/package*.json /polisServer/
WORKDIR /polisServer
RUN npm i -D eslint
RUN npm install

COPY .env_dev /polisServer/
COPY polisServer /polisServer/

EXPOSE 5000
#CMD node --max_old_space_size=400 --gc_interval=100 --harmony app.js
ENTRYPOINT ["sh", "x"]

