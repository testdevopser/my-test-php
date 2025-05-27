#!/bin/bash
# Запускаем php-fpm и nginx
php-fpm -D
nginx -g "daemon off;"
