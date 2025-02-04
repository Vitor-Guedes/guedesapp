#!/usr/bin/env bash

echo "PORT:${PORT}, ${MONGODB_URL}, ${MONGODB_DB} \n";

cat .env;

composer update -d /var/www/html --no-dev --no-interaction --optimize-autoloader;

chmod -R 777 /var/www/html/var

apache2-foreground