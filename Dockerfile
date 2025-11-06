FROM nginx:alpine

# Удаляем дефолтный конфиг
RUN rm /etc/nginx/conf.d/default.conf

# Копируем сайт
COPY . /usr/share/nginx/html

# Копируем наш конфиг
COPY nginx.conf /etc/nginx/conf.d/default.conf

# Cloud Run использует PORT, но nginx может слушать только фиксированный порт,
# поэтому просто ставим 8080.
EXPOSE 8080

CMD ["nginx", "-g", "daemon off;"]
