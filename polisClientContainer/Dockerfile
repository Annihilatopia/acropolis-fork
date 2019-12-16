FROM ubuntu:16.04


# Install dependencies and packages
RUN apt-get update && apt-get install -y git nginx curl python-minimal build-essential

# Setup nvm
RUN mkdir -p /usr/local/nvm
ENV NVM_DIR /usr/local/nvm
ENV NODE_VERSION 10.16.3

RUN curl https://raw.githubusercontent.com/nvm-sh/nvm/v0.35.1/install.sh | bash \
    && . $NVM_DIR/nvm.sh \
    && nvm install $NODE_VERSION \
    && nvm alias default $NODE_VERSION \
    && nvm use default

ENV NODE_PATH $NVM_DIR/versions/node/v$NODE_VERSION/lib/node_modules
ENV PATH      $NVM_DIR/versions/node/v$NODE_VERSION/bin:$PATH



# Verify npm and node version
RUN npm -v
RUN node -v

# Setup polisClientAdmin
COPY config.js polisClient/src/
COPY polisClient polisClient/
WORKDIR polisClient
RUN npm install
RUN npm run build

# Setup static dist directory on nginx
COPY default /etc/nginx/sites-available

EXPOSE 80

CMD ["nginx", "-g", "daemon off;"]
