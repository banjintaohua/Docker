# php:5.6.40-fpm already comes with the following extensions
#
# [PHP Modules]
#   Core ctype curl date dom ereg fileinfo filter ftp hash iconv json libxml mbstring mhash mysqlnd
#   openssl pcre PDO pdo_sqlite Phar posix readline Reflection session SimpleXML
#   SPL sqlite3 standard tokenizer xml xmlreader xmlwriter zlib
# [Zend Modules]

FROM php:5.6.40-fpm

LABEL maintainer="banjintaohua"

ENV PEAR_HTTP_PROXY http://10.211.55.2:1087

COPY --from=composer:1.10 /usr/bin/composer /usr/local/bin/composer

RUN cp /usr/local/etc/php/php.ini-production /usr/local/etc/php/php.ini \
    && pear config-set php_ini /usr/local/etc/php/php.ini \
    # debian 9.x (buster) mirror \
    && sed -i -E 's/(deb|security).debian.org/mirrors.aliyun.com/g' /etc/apt/sources.list \
    # apt install
    && apt update \
    && apt install -y vim dnsutils iputils-ping \
    && apt install -y netcat-openbsd \
    && apt install -y git \
    && apt install -y libmcrypt-dev \
    && apt install -y libpng-dev libssl-dev \
    && apt install -y libzip-dev zlib1g-dev \
    # docker-php-ext-install
    && docker-php-ext-install mysql mysqli pdo_mysql zip \
    && docker-php-ext-install mcrypt \
    && docker-php-ext-install gd \
    && docker-php-ext-install zip \
    # pecl install
    && pear config-set http_proxy ${PEAR_HTTP_PROXY} \
    && pecl install xdebug-2.5.5 \
    && pear config-set http_proxy '' \
    # clear
    && rm -rf /tmp/* /var/cache/apt/*

WORKDIR /var/www