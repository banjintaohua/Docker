FROM php:7.4.20-fpm

LABEL maintainer="banjintaohua"

# 通过 PECL 安装拓展遇到连接超时问题时, 需要设置代理
# Connection to `pecl.php.net:80' failed: Connection refused
# sudo pear config-set http_proxy http://127.0.0.1:1087

# 使用网易源会有问题，暂时先用官方的源吧
# RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
#     && echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list \
#     && echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list \
#     && echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list \
#     && apt-get update \

RUN apt-get update \
    # 基本工具包
    && apt-get install -y vim \
    # 命令补全工具
    && apt-get install -y bash-completion \
    && echo 'source /etc/profile.d/bash_completion.sh' >> /root/.bashrc \
    && alias ll='ls -l' \
    # Git
    && apt-get install -y git \
    # PHP 配置文件
    && cp /usr/local/etc/php/php.ini-development /usr/local/etc/php/php.ini \
    && pear config-set php_ini /usr/local/etc/php/php.ini \
    # swoole
    && pecl install swoole-4.5.9 \
    && docker-php-ext-enable swoole \
    # YAF 拓展
    && pecl install yaf \
    # 数据库
    && docker-php-ext-install mysqli pdo_mysql \
    # GD
    && apt-get -y install libssl-dev \
    && apt-get install -y libjpeg62-turbo-dev libpng-dev libfreetype6-dev \
    && docker-php-ext-configure gd --with-jpeg --with-freetype \
    && docker-php-ext-install gd \
    # intl 国际化拓展
    && apt-get -y install libicu-dev \
    && docker-php-ext-install intl \
    # SOAP 扩展
    && apt-get -y install libxml2-dev \
    && docker-php-ext-install soap \
    # Excel 依赖
    && apt-get install -y libzip-dev zlib1g-dev \
    && docker-php-ext-install zip \
    # 其他依赖
    && docker-php-ext-install bcmath gettext pcntl shmop sockets sysvsem xmlrpc opcache \
    # redis 缓存
    && pecl install redis \
    && docker-php-ext-enable redis \
    # memcached 缓存
    && mkdir -p /usr/src/php/ext/memcached/ \
    && cd /usr/src/php/ext/memcached/ \
    && apt-get -y install libmemcached-dev wget unzip \
    && wget https://github.com/php-memcached-dev/php-memcached/archive/v3.1.5.zip \
    && unzip v3.1.5.zip \
    && rm v3.1.5.zip \
    && mv php-memcached-3.1.5/* ./ \
    && docker-php-ext-configure memcached \
    && docker-php-ext-install memcached \
    # 优先使用 Xdebug3，Xdebug3 的性能比 Xdebug2 的好
    && pecl install xdebug-3.1.2

    # 微信
    # && cd /usr/src/php/ext \
    # && git clone https://github.com/pangdahua/php7-wxwork-finance-sdk.git \
    # && cd php7-wxwork-finance-sdk \
    # && phpize \
    # && export INSTALL_PHP_PATH=/usr/local/bin \
    # && export WXWORK_FINANCE_SDK=/usr/local/php/wxwork \
    # && ./configure --with-php-config=$INSTALL_PHP_PATH/php-config --with-wxwork-finance-sdk=$WXWORK_FINANCE_SDK \

 WORKDIR /var/www