# Use the official PHP image with Apache as the base image
FROM php:8.3-apache

# Install necessary libraries
RUN apt-get update -y && apt-get install -y \
    git \ 
    libssl-dev \
    libonig-dev \
    libzip-dev

    # Install PHP extensions
RUN docker-php-ext-install \
    mbstring \
    zip

RUN pecl install mongodb && docker-php-ext-enable mongodb

WORKDIR /var/www/html

COPY . ./

COPY /infra/apache/apache-config.conf /etc/apache2/sites-available/000-default.conf

# Use the PORT environment variable in Apache configuration files.
# https://cloud.google.com/run/docs/reference/container-contract#port
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

ARG MONGODB_DB
ENV MONGODB_DB=${MONGODB_DB}

ARG MONGODB_URL
ENV MONGODB_URL=${MONGODB_URL}

COPY .env.example .env

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Start the Apache web server when the container starts
RUN composer install --no-dev --optimize-autoloader -d /var/www/html

RUN chmod -R 777 /var/www/html/var

EXPOSE ${PORT}