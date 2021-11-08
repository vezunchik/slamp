FROM php:8.0.12-fpm-alpine3.13

COPY ./ini/php.ini-development /usr/local/etc/php/php.ini

WORKDIR /app/public

RUN apk update && apk add \
      wget \
      git \
      bash \
      php8-dev \
      icu-dev \
      && docker-php-ext-configure intl \
      && docker-php-ext-install intl \
      && docker-php-ext-configure opcache --enable-opcache \
      && docker-php-ext-install opcache

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

# Install CLI symfony
RUN wget https://get.symfony.com/cli/installer -O - | bash
RUN mv /root/.symfony/bin/symfony /usr/local/bin/symfony

ARG HOST_GID
ARG HOST_UID
ARG HOST_USER
ARG HOST_GROUP

RUN addgroup --gid $HOST_GID $HOST_GROUP
RUN adduser --disabled-password --gecos '' --uid $HOST_UID -G $HOST_GROUP $HOST_USER
USER $HOST_USER

RUN git config --global user.email "test@test.com" \
      && git config --global user.name "test"