# Берём лёгкий nginx
FROM nginx:alpine

# Копируем все файлы сайта
COPY . /usr/share/nginx/html

# Копируем кастомный конфиг nginx
COPY nginx.conf /etc/nginx/nginx.conf

# Запуск
CMD ["nginx", "-g", "daemon off;"]
