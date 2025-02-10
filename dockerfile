FROM php:8.2-apache

# Enable required PHP extensions
RUN apt-get update && apt-get install -y \
    libpng-dev libjpeg-dev libfreetype6-dev libonig-dev zip unzip git curl \
    && docker-php-ext-install pdo pdo_mysql mbstring exif gd

# Enable Apache mod_rewrite
RUN a2enmod rewrite
RUN echo 'DocumentRoot /var/www/symfony/public' > /etc/apache2/sites-available/000-default.conf

# Set the working directory
WORKDIR /var/www/symfony

# Copy project files to the container
COPY . /var/www/symfony

# Ensure the public directory is properly set
COPY ./public /var/www/symfony/public

# Expose port 80
EXPOSE 80

CMD ["apache2-foreground"]
