FROM php:8.3-cli

RUN apt-get update \
    && apt-get install -y --no-install-recommends \
        git \
        unzip \
        libzip-dev \
        sqlite3 \
        libsqlite3-dev \
    && docker-php-ext-install pdo_mysql pdo_sqlite \
    && apt-get clean \
    && rm -rf /var/lib/apt/lists/*

COPY --from=composer:2.8 /usr/bin/composer /usr/local/bin/composer

WORKDIR /var/www/html

COPY . .

EXPOSE 8000

CMD ["sh", "-c", "composer install && php artisan serve --host=0.0.0.0 --port=8000"]
