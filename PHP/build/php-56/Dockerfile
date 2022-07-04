FROM php:5.6.40-fpm

LABEL maintainer="banjintaohua"

COPY --from=composer:1.10.26 /usr/bin/composer /usr/local/bin/composer

# 通过 PECL 安装拓展遇到连接超时问题时, 需要设置代理
# Connection to `pecl.php.net:80' failed: Connection refused
# sudo pear config-set http_proxy http://127.0.0.1:1087
RUN mv /etc/apt/sources.list /etc/apt/sources.list.bak \
    && echo 'deb http://mirrors.163.com/debian/ stretch main non-free contrib' > /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian/ stretch-updates main non-free contrib' >> /etc/apt/sources.list \
    && echo 'deb http://mirrors.163.com/debian-security/ stretch/updates main non-free contrib' >> /etc/apt/sources.list \
    && apt update \
    # 基本工具包
    && apt install -y vim dnsutils iputils-ping \
    && apt install -y netcat-openbsd \
    && apt install -y git \
    # 命令补全工具
    && apt install -y bash-completion \
    && echo 'source /etc/profile.d/bash_completion.sh' >> /root/.bashrc \
    # 加密解密
    && apt install -y libmcrypt-dev \
    && docker-php-ext-install mcrypt \
    # GD 库
    && apt -y install libpng-dev libssl-dev \
    && docker-php-ext-install gd \
    # Excel 依赖
    && apt install -y libzip-dev zlib1g-dev \
    && docker-php-ext-install zip \
    # 数据库
    && docker-php-ext-install mysql mysqli pdo_mysql zip \
    # 断点调试
    && pecl install xdebug-2.5.5 \
    # 清理缓存
    && rm -rf /tmp/* /var/cache/apt/*


WORKDIR /var/www