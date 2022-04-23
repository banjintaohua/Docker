FROM node:12.14.0-alpine

LABEL maintainer="banjintaohua"

ARG GIT_EMAIL
ARG GIT_USER

COPY . /tmp/build

# 注意：直接执行 hexo init 后包的版本比较新，需要用指定的 package.json 文件覆盖安装为指定的旧版本
# 注意：在 source 目录下有 categlsories 的 index.md 时才会生成分类信息（注意 index.md 的文件内容需要有 title、date、type 这三个）
# 注意：使用 hexo generate --debug 可以查看具体的报错信息 https://github.com/hexojs/hexo/issues/1837

RUN mv /tmp/build/entrypoint.sh /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories \
    && apk add bash-completion \
    && echo "source /etc/profile.d/bash_completion.sh" > /root/.bash_profile \
    && apk add --progress git openssh openssh-server tzdata curl \
    && ssh-keygen -A \
    # 需要先设置一下密码才可以使用公钥认证
    && echo 'root:Ch@ngMe' | chpasswd \
    && echo "StrictHostKeyChecking no" >> /etc/ssh/ssh_config \
    && echo "UserKnownHostsFile /dev/null" >> /etc/ssh/ssh_config \
    && echo "RSAAuthentication yes" >> /etc/ssh/sshd_config \
    && echo "PubkeyAuthentication yes" >> /etc/ssh/sshd_config \
    && echo "AuthorizedKeysFile .ssh/authorized_keys" >> /etc/ssh/sshd_config \
    && echo "PasswordAuthentication no" >> /etc/ssh/sshd_config \
    && git config --global user.email ${GIT_EMAIL} \
    && git config --global user.name ${GIT_USER} \
    && npm config set registry 'http://registry.npm.taobao.org' \
    && npm install --verbose --global hexo-cli@3.1.0 \
    && mkdir -p /usr/local/opt/hexo/blog \
    && cd /usr/local/opt/hexo/blog \
    && hexo init \
    && mv -f /tmp/build/hexo/package.json /usr/local/opt/hexo/blog/ \
    && npm install --verbose \
    && npm install --verbose hexo-deployer-git@2.1.0 --save \
    && npm install --verbose hexo-generator-searchdb@1.2.0 --save \
    && npm install --verbose hexo-symbols-count-time@0.7.1 --save \
    && npm install --verbose hexo-auto-category@0.2.0 --save \
    && mv -f /tmp/build/hexo/about/ /usr/local/opt/hexo/blog/source/ \
    && mv -f /tmp/build/hexo/categories/ /usr/local/opt/hexo/blog/source/ \
    && rm -rf /usr/local/opt/hexo/blog/source/_posts \
    # 这个 Git 下载实在太离谱了，直接把整个项目打包放到 build 目录得了
    # && git clone -b v7.6.0 -v https://github.com/theme-next/hexo-theme-next /usr/local/opt/hexo/blog/themes/next \
    && mkdir -p /usr/local/opt/hexo/blog/themes \
    && tar -xvzf /tmp/build/hexo/next.tar.gz -C /usr/local/opt/hexo/blog/themes \
    && rm -f /usr/local/opt/hexo/blog/themes/next/layout/_partials/sidebar/site-overview.swig \
    && mv -f /tmp/build/hexo/site-overview.swig /usr/local/opt/hexo/blog/themes/next/layout/_partials/sidebar/site-overview.swig \
    && rm -f /usr/local/opt/hexo/blog/themes/next/source/css/_common/components/post/post.styl \
    && mv -f /tmp/build/hexo/post.styl /usr/local/opt/hexo/blog/themes/next/source/css/_common/components/post/post.styl \
    && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 4000 22

WORKDIR /usr/local/opt/hexo/blog/source/_posts

ENTRYPOINT ["entrypoint.sh"]