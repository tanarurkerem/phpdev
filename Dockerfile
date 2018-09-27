FROM php:7.2.8-cli
RUN apt-get update -y
RUN apt-get install -y git unzip zip
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN pecl install xdebug-2.6.0 \
    && docker-php-ext-enable xdebug
