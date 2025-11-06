# Используем минимальный образ nginx
FROM nginx:alpine

# Копируем все файлы сайта в папку nginx
COPY . /usr/share/nginx/html

# Expose порт 8080
EXPOSE 8080

# Запускаем nginx
CMD ["nginx", "-g", "daemon off;"]
