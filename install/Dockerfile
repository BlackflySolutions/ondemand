FROM php:7.0-apache
# install the PHP extensions we need. We could just FROM our main vhttp, except we also need the mysql-client
RUN apt-get update && apt-get install -y libpng12-dev libjpeg-dev libpq-dev mysql-client \
	&& rm -rf /var/lib/apt/lists/* \
	&& docker-php-ext-configure gd --with-png-dir=/usr --with-jpeg-dir=/usr \
	&& docker-php-ext-install gd mbstring pdo pdo_mysql pdo_pgsql zip
WORKDIR /var/www/html
# above a copy of vhttp
COPY drush.phar /usr/local/bin/drush
COPY install.sh /usr/local/bin/install.sh
COPY wait-for-it.sh /usr/local/bin/wait-for-it.sh
RUN chmod u+x /usr/local/bin/drush && chmod u+x /usr/local/bin/install.sh && chmod u+x /usr/local/bin/wait-for-it.sh 
# CMD["apache2-foreground"]
CMD /usr/local/bin/install.sh
