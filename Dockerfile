FROM node:20-bookworm

RUN npx -y playwright@1.55.0 install --with-deps

# ARG PLAYWRIGHT_VERSION=1.55.1

# RUN npx -y "playwright@${PLAYWRIGHT_VERSION}" install --with-deps

# WORKDIR usr/src/app

# COPY package*.json ./

# RUN npm ci

# COPY . .

# CMD ["npx", "playwright", "test"]