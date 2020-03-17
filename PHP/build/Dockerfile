FROM php:5.6.40-fpm

# 通过 PECL 安装拓展遇到连接超时问题时, 需要设置代理
# Connection to `pecl.php.net:80' failed: Connection refused
# sudo pear config-set http_proxy http://127.0.0.1:1087
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list \
    && apt-get update \
    && pecl install xdebug-2.5.5 \
    && docker-php-ext-install mysql mysqli pdo_mysql \
    && docker-php-ext-enable xdebug

 WORKDIR /usr/local/www/data