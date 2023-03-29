FROM centos:7

LABEL maintainer="banjintaohua"

# 阿里云 https://mirrors.aliyun.com/repo/Centos-7.repo
# 腾讯云 http://mirrors.tencent.com/repo/centos7_base.repo
ENV YUM_MIRROR http://mirrors.tencent.com/repo/centos7_base.repo
ENV YUM_EPEL_MIRRIR http://mirrors.aliyun.com/repo/epel-7.repo
ENV REMI_RELEASE_7 https://mirrors.aliyun.com/remi/enterprise/remi-release-7.rpm

RUN rm -rf /etc/yum.repos.d/CentOS* \
    # yum
    && echo 'tsflags=nodocs' >> /etc/yum.conf \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo ${YUM_MIRROR} \
    && curl -o /etc/yum.repos.d/epel.repo ${YUM_EPEL_MIRRIR} \
    && yum install -y ${REMI_RELEASE_7} \
    && yum clean all \
    && yum makecache fast \
    # file
    && yum install -y tar zip unzip bzip2 \
    # network
    && yum install -y openssh wget lrzsz lsof telnet net-tools nmap-ncat bind-utils \
    # code
    && yum install -y git vim dos2unix unix2dos \
    # build
    && yum install -y rpm-build gcc gcc-c++ gettext libtool make automake autoconf \
    && mkdir -p /rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} \
    && echo '%_topdir /rpmbuild' > ~/.rpmmacros \
    && sed -ie 's/keepcache=0/keepcache=1/g' /etc/yum.conf \
    # devel
    && yum install -y openldap-devel curl-devel openssl-devel zlib-devel perl-devel \
    && yum install -y python3-devel \
    && yum install -y php74-php-devel \
    && ln -s /opt/remi/php74/root/usr/bin/phar.phar /usr/bin/phar \
    && ln -s /opt/remi/php74/root/usr/bin/phar.phar /usr/bin/phar.phar \
    && ln -s /opt/remi/php74/root/usr/bin/php /usr/bin/php \
    && ln -s /opt/remi/php74/root/usr/bin/php-cgi /usr/bin/php-cgi \
    && ln -s /opt/remi/php74/root/usr/bin/phpize /usr/bin/phpize \
    # clear
    && yum clean all \
    && rpm --rebuilddb \
    && rm -rf /tmp/*

WORKDIR /rpmbuild/RPMS/

CMD tail -f /dev/null