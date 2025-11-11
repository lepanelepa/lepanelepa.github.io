FROM node:20

WORKDIR /app

# Копируем package.json и package-lock.json
COPY package*.json ./

# Устанавливаем зависимости
RUN npm install

# Копируем серверный файл и фронтенд
COPY server.js ./
COPY public ./public

EXPOSE 8080

CMD ["node", "server.js"]
