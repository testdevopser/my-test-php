# Базовый образ с PHP и FPM
FROM php:8.1-fpm

# Установка nginx
RUN apt-get update && apt-get install -y nginx && \
    apt-get clean && rm -rf /var/lib/apt/lists/*

# Копируем index.php в нужное место
COPY index.php /var/www/html/

# Копируем конфигурацию nginx
COPY default.conf /etc/nginx/conf.d/default.conf

# Разрешаем nginx и php-fpm работать с правами
RUN chown -R www-data:www-data /var/www/html

# Копируем и запускаем скрипт запуска обоих процессов
COPY docker-entrypoint.sh /usr/local/bin/
RUN chmod +x /usr/local/bin/docker-entrypoint.sh

# Открываем порт 80
EXPOSE 80

# Устанавливаем точку входа
CMD ["docker-entrypoint.sh"]
