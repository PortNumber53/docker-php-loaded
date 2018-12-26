FROM php:7.2.13-stretch


LABEL maintainer="grimlock@portnumber53.com"

RUN pecl install redis-4.0.1 \
    && pecl install xdebug-2.6.0 \
    && docker-php-ext-enable redis xdebug

