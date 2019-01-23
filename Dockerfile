
FROM php:7.2-apache

EXPOSE 80

RUN apt-get update && apt-get install -y \
git \
vim \
zip \
zlib1g-dev

RUN docker-php-ext-install zip

RUN a2enmod rewrite

RUN curl -sS https://getcomposer.org/installer | \
php -- --install-dir=/usr/local/bin --filename=composer



RUN composer create-project --prefer-dist laravel/lumen sprii_test -n

CMD php -S 0.0.0.0:80 -t sprii_test/public

