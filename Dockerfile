# Use the official PHP image with Apache as the base image
FROM php:8.3-apache

# Configure PHP for Cloud Run.
# Precompile PHP code with opcache.
RUN docker-php-ext-install -j "$(nproc)" opcache
RUN set -ex; \
  { \
    echo "; Cloud Run enforces memory & timeouts"; \
    echo "memory_limit = -1"; \
    echo "max_execution_time = 0"; \
    echo "; File upload at Cloud Run network limit"; \
    echo "upload_max_filesize = 32M"; \
    echo "post_max_size = 32M"; \
    echo "; Configure Opcache for Containers"; \
    echo "opcache.enable = On"; \
    echo "opcache.validate_timestamps = On"; \
    echo "; Configure Opcache Memory (Application-specific)"; \
    echo "opcache.memory_consumption = 32"; \
  } > "$PHP_INI_DIR/conf.d/cloud-run.ini"


# Set the working directory to the web root
WORKDIR /var/www/html

# Copy your application files to the appropriate directory
COPY . ./

COPY /infra/apache/apache-config.conf /etc/apache2/sites-available/000-default.conf

# Use the PORT environment variable in Apache configuration files.
# https://cloud.google.com/run/docs/reference/container-contract#port
RUN sed -i 's/80/${PORT}/g' /etc/apache2/sites-available/000-default.conf /etc/apache2/ports.conf

# Expose the default HTTP port (port 80)
EXPOSE ${PORT}

# Enable the rewrite module (assuming your PHP application uses URL rewriting)
RUN a2enmod rewrite

# Install Composer
COPY --from=composer:latest /usr/bin/composer /usr/bin/composer

# Switch back to the non-privileged user to run the application
USER www-data

# Install any necessary PHP extensions or dependencies here (if needed)
# For example, if you use database connections, you might need to install relevant extensions.

# Start the Apache web server when the container starts
RUN composer install -d /var/www/html --no-dev --no-interaction --optimize-autoloader

CMD ["apache2-foreground"]