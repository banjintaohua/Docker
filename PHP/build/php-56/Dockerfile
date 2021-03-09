FROM php:5.6.40-fpm

LABEL maintainer="example"

# 通过 PECL 安装拓展遇到连接超时问题时, 需要设置代理
# Connection to `pecl.php.net:80' failed: Connection refused
# sudo pear config-set http_proxy http://127.0.0.1:1087
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list \
    && apt-get update \
    # 基本工具包
    && apt-get install -y vim \
    # 命令补全工具
    && apt-get install -y bash-completion \
    && echo 'source /etc/profile.d/bash_completion.sh' >> /root/.bashrc \
    # 加密解密
    && apt-get install -y libmcrypt-dev \
    && docker-php-ext-install mcrypt \
    # Excel 依赖
    && apt-get install -y libzip-dev zlib1g-dev \
    && docker-php-ext-install zip \
    # 数据库
    && docker-php-ext-install mysql mysqli pdo_mysql zip \
    # 断点调试
    && pecl install xdebug-2.5.5

WORKDIR /usr/local/www/data