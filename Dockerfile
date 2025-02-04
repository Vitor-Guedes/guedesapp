# Use the official PHP image with Apache as the base image
FROM php:8.3-apache

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

# Install any necessary PHP extensions or dependencies here (if needed)
# For example, if you use database connections, you might need to install relevant extensions.

# Start the Apache web server when the container starts
CMD ["apache2-foreground"]