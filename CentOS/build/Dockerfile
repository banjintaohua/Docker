FROM centos:7

LABEL maintainer="banjintaohua"

# 阿里云 https://mirrors.aliyun.com/repo/Centos-7.repo
# 腾讯云 http://mirrors.cloud.tencent.com/repo/centos7_base.repo
ENV YUM_MIRROR http://mirrors.cloud.tencent.com/repo/centos7_base.repo
ENV YUM_EPEL_MIRRIR http://mirrors.aliyun.com/repo/epel-7.repo
ENV REMI_RELEASE_7 https://mirrors.aliyun.com/remi/enterprise/remi-release-7.rpm

RUN mv /etc/yum.repos.d/CentOS-Base.repo /etc/yum.repos.d/CentOS-Base.repo.backup \
    && curl -o /etc/yum.repos.d/CentOS-Base.repo ${YUM_MIRROR} \
    && curl -o /etc/yum.repos.d/epel.repo ${YUM_EPEL_MIRRIR} \
    && yum install -y ${REMI_RELEASE_7} \
    && yum clean all \
    && yum makecache fast \
    && yum install -y vim openssh \
    && yum install -y centos-release-scl \
    && yum install -y devtoolset-7-gcc* \
    && scl enable devtoolset-7 bash \
    && yum install -y openldap-devel \
    && yum install -y python3-devel \
    && rpm -e php-cli-5.4.16-48.el7.x86_64 php-common-5.4.16-48.el7.x86_64 php-devel-5.4.16-48.el7.x86_64 \
    && yum install -y php74 \
    && yum install -y php74-php-devel \
    && scl enable php74 bash \
    && yum install -y git \
    && yum install -y lrzsz wget \
    && yum install -y rpm-build tar gcc make \
    && mkdir -p /rpmbuild/{BUILD,RPMS,SOURCES,SPECS,SRPMS} \
    && echo '%_topdir /rpmbuild' > ~/.rpmmacros \
    && sed -ie 's/keepcache=0/keepcache=1/g' /etc/yum.conf

WORKDIR /rpmbuild/RPMS/

CMD tail -f /dev/null