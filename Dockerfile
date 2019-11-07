FROM php:7.3-cli
RUN apt-get update -y
RUN apt-get install -y git unzip zip libicu-dev
RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');"
RUN php composer-setup.php
RUN php -r "unlink('composer-setup.php');"
RUN mv composer.phar /usr/local/bin/composer
RUN curl -sS https://get.symfony.com/cli/installer | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony
RUN docker-php-ext-install intl
COPY php.ini /usr/local/etc/php/php.ini
RUN docker-php-ext-install opcache
#RUN pecl install xdebug-2.6.0 \
#    && docker-php-ext-enable xdebug
