FROM php:7.2.34-fpm

LABEL maintainer="example@mail.com"

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
    # YAF 拓展
    && pecl install yaf \
    # 数据库
    && docker-php-ext-install mysqli pdo_mysql \
    # GD
    && apt-get -y install libpng-dev libssl-dev \
    && docker-php-ext-install gd \
    # XDebug
    && pecl install xdebug-2.9.8

 WORKDIR /var/www