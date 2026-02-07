FROM node:20-bookworm

RUN npx -y playwright@1.58.0 install --with-deps

# ARG PLAYWRIGHT_VERSION=1.55.1

# RUN npx -y "playwright@${PLAYWRIGHT_VERSION}" install --with-deps

# WORKDIR usr/src/app

# COPY package*.json ./

# RUN npm ci

# COPY . .

# CMD ["npx", "playwright", "test"]

# Uruchomienie agenta z UI (w przeglądarce na hoście):
#   docker run -it --rm --ipc=host -p 8080:8080 -v $(pwd):/app -w /app <obraz> npx playwright test --ui --ui-host=0.0.0.0 --ui-port=8080
# Następnie otwórz http://localhost:8080