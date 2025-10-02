FROM composer:2 AS composer

FROM php:8.2-cli

ENV COMPOSER_ALLOW_SUPERUSER=1

WORKDIR /app

RUN apt-get update \
    && apt-get install -y --no-install-recommends git unzip libzip-dev zlib1g-dev \
    && docker-php-ext-install zip \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer /usr/bin/composer /usr/bin/composer

COPY . .

RUN composer install --no-dev --prefer-dist --no-interaction --no-progress \
    && chmod +x docker/entrypoint.sh \
    && php artisan package:discover --ansi

ENTRYPOINT ["./docker/entrypoint.sh"]
CMD []
