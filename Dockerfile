FROM php:5.6-apache
RUN pecl install xdebug \
    && docker-php-ext-enable xdebug \
    && echo "xdebug.idekey = netbeans-xdebug" > /usr/local/etc/php/conf.d/ext-xdebug.ini \
    && echo "default_charset = " > /usr/local/etc/php/php.ini \
    && echo "date.timezone = America/Sao_Paulo" >> /usr/local/etc/php/php.ini \
    && sed -i '1 a xdebug.remote_autostart=true' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
	&& sed -i '1 a xdebug.remote_mode=req' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
	&& sed -i '1 a xdebug.remote_handler=dbgp' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
	&& sed -i '1 a xdebug.remote_connect_back=1 ' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
	&& sed -i '1 a xdebug.remote_port=9000' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
	&& sed -i '1 a xdebug.remote_host=127.0.0.1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
	&& sed -i '1 a xdebug.remote_enable=1' /usr/local/etc/php/conf.d/docker-php-ext-xdebug.ini \
	&& docker-php-ext-install mysql mysqli pdo pdo_mysql \
	&& sed -i "s/AllowOverride None/AllowOverride All/g" /etc/apache2/apache2.conf

RUN a2enmod rewrite
