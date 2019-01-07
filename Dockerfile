FROM php:7.2.13-fpm-stretch

LABEL maintainer="grimlock@portnumber53.com"

# Update system
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        rsync \
        zip \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug unzip \
    && docker-php-ext-enable xdebug

