# Используем минимальный образ nginx
FROM nginx:alpine

# Копируем все файлы сайта в папку nginx
COPY . /usr/share/nginx/html

# Expose порт 80
EXPOSE 80

# Запускаем nginx
CMD ["nginx", "-g", "daemon off;"]
