FROM php:8.2-apache

# COPY ./src /srv/app
RUN mkdir /srv/app
COPY ./vhost.conf /etc/apache2/sites-available/000-default.conf

RUN chown -R www-data:www-data /srv/app \
    && a2enmod rewrite


# RUN COPY ./src/composer.phar /bin/composer.phar
# RUN chmod a+x /bin/composer.phar

RUN apt-get update -y 
RUN apt-get install git unzip -y

# Install Composer
RUN curl -sS https://getcomposer.org/installer | php -- --install-dir=/usr/local/bin --filename=composer

