# php:7.4.20-fpm already comes with the following extensions
#
# [PHP Modules]
#   Core ctype curl date dom fileinfo filter ftp hash iconv json libxml mbstring mysqlnd
#   openssl pcre PDO pdo_sqlite Phar posix readline Reflection session SimpleXML sodium
#   SPL sqlite3 standard tokenizer xml xmlreader xmlwriter zlib
# [Zend Modules]

FROM php:7.4.20-fpm

LABEL maintainer="banjintaohua"

ENV PEAR_HTTP_PROXY http://10.211.55.2:1087
ENV XDEBUG_VERSION 3.1.2
ENV SWOOLE_VERSION 4.5.9

COPY --from=composer:1.10 /usr/bin/composer /usr/local/bin/composer

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && pear config-set php_ini /usr/local/etc/php/php.ini \
    # debian 10.x (buster) mirror
    && sed -i -E 's/(deb|security).debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    # apt install
    && apt update \
    && apt install -y vim dnsutils iputils-ping \
    && apt install -y netcat-openbsd \
    && apt install -y git \
    && apt install -y libzip-dev zlib1g-dev libssl-dev  \
    && apt install -y libjpeg62-turbo-dev libpng-dev libfreetype6-dev \
    && apt install -y libicu-dev \
    && apt install -y libxml2-dev \
    # docker-php-ext-install
    && docker-php-ext-install bcmath gettext pcntl shmop sockets sysvsem xmlrpc opcache \
    && docker-php-ext-install mysqli pdo_mysql zip \
    && docker-php-ext-install gd && docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install intl \
    && docker-php-ext-install soap \
    # pecl install
    && pear config-set http_proxy ${PEAR_HTTP_PROXY} \
    && pecl install xdebug-${XDEBUG_VERSION} && docker-php-ext-enable xdebug \
    && pecl install redis && docker-php-ext-enable redis \
    && pecl install mongodb && docker-php-ext-enable mongodb \
    && pecl install swoole-${SWOOLE_VERSION} \
    && pecl install yaf \
    && pear config-set http_proxy '' \
    # git install
    && git clone https://github.com/tideways/php-xhprof-extension.git /tmp/tideways \
    && cd /tmp/tideways && phpize && ./configure && make && make install \
    # clear
    && rm -rf /tmp/* /var/cache/apt/*

WORKDIR /var/www