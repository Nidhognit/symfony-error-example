#dev
FROM php:7.4.6-fpm
RUN apt-get update && apt-get install -y \
        libfreetype6-dev \
        libjpeg62-turbo-dev \
        libpng-dev \
        libzip-dev \
        zip \
        libicu-dev \
    && docker-php-ext-configure gd --with-freetype --with-jpeg \
    && docker-php-ext-install -j$(nproc) gd \
    && docker-php-ext-install zip \
    && ln -s /usr/bin/php7 /usr/bin/php \
    && docker-php-ext-install opcache \
    && pecl install xdebug-2.9.0 \
    && docker-php-ext-enable xdebug \
    && docker-php-ext-install mysqli pdo pdo_mysql \
    && docker-php-ext-configure intl\
    && docker-php-ext-install intl \
    && pecl install apcu \
    && docker-php-ext-enable apcu

# install composer
RUN	curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

WORKDIR /app