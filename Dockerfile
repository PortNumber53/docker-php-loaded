FROM php:7.2.13-fpm-stretch

LABEL maintainer="grimlock@portnumber53.com"

# Update system
RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        libzip-dev \
        openssh-client \
        rsync \
        unzip \
    && rm -rf /var/lib/apt/lists/*

RUN pecl install xdebug zip \
    && docker-php-ext-enable xdebug zip

RUN php -r "copy('https://getcomposer.org/installer', 'composer-setup.php');" \
      && php -r "if (hash_file('sha384', 'composer-setup.php') === '93b54496392c062774670ac18b134c3b3a95e5a5e5c8f1a9f115f203b75bf9a129d5daa8ba6a13e2cc8a1da0806388a8') { echo 'Installer verified'; } else { echo 'Installer corrupt'; unlink('composer-setup.php'); } echo PHP_EOL;" \
      && php composer-setup.php \
      && php -r "unlink('composer-setup.php');" \
      && chmod a+x composer.phar \
      && mv composer.phar /usr/bin/composer

