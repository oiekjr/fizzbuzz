#!/bin/sh
set -eu

if [ ! -f vendor/autoload.php ]; then
    composer install --no-interaction --prefer-dist --no-progress
fi

if [ "$#" -eq 0 ]; then
    echo "Usage: docker run <image> <limit>" >&2
    exit 1
fi

case "$1" in
    serve)
        shift
        exec php artisan serve --host=0.0.0.0 --port=8000 "$@"
        ;;
    artisan)
        shift
        exec php artisan "$@"
        ;;
    *)
        exec php artisan app:fizzbuzz "$@"
        ;;
esac
