FROM node:12.14.0-alpine

LABEL maintainer="fjxzyx@gmail.com"

ARG BLOG_REPOSITORY
ARG AUTHORIZED_KEY

COPY . /tmp/hexo

# 注意：直接执行 hexo init 后包的版本比较新，需要用指定的 package.json 文件覆盖安装为指定的旧版本
# 注意：在 source 目录下有 categlsories 的 index.md 时才会生成分类信息（注意 index.md 的文件内容需要有 title、date、type 这三个）
# 注意：使用 hexo generate --debug 可以查看具体的报错信息 https://github.com/hexojs/hexo/issues/1837

RUN sed -i "s/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g" /etc/apk/repositories \
    && apk add --progress git openssh openssh-server tzdata \
    && ssh-keygen -A \
    && mkdir -p /root/.ssh \
    && echo "$AUTHORIZED_KEY" >> /root/.ssh/authorized_keys \
    && chmod 600 /root/.ssh/authorized_keys \
    && git config --global user.email fjxzyx@gmail.com \
    && git config --global user.name banjintaohua \
    && npm config set registry 'http://registry.npm.taobao.org' \
    && npm install --verbose --global hexo-cli@3.1.0 \
    && mkdir -p /usr/local/opt/hexo/blog \
    && cd /usr/local/opt/hexo/blog \
    && hexo init \
    && mv -f /tmp/hexo/package.json /usr/local/opt/hexo/blog/ \
    && npm install --verbose \
    && npm install --verbose hexo-deployer-git@2.1.0 --save \
    && npm install --verbose hexo-generator-searchdb@1.2.0 --save \
    && npm install --verbose hexo-symbols-count-time@0.7.1 --save \
    && npm install --verbose hexo-auto-category@0.2.0 --save \
    && mv -f /tmp/hexo/about/ /usr/local/opt/hexo/blog/source/ \
    && mv -f /tmp/hexo/categories/ /usr/local/opt/hexo/blog/source/ \
    && rm -rf /usr/local/opt/hexo/blog/source/_posts \
    && git clone -b v7.6.0 -v https://github.com/theme-next/hexo-theme-next /usr/local/opt/hexo/blog/themes/next \
    && rm -f /usr/local/opt/hexo/blog/themes/next/layout/_partials/sidebar/site-overview.swig \
    && mv -f /tmp/hexo/site-overview.swig /usr/local/opt/hexo/blog/themes/next/layout/_partials/sidebar/site-overview.swig \
    && rm -f /usr/local/opt/hexo/blog/themes/next/source/css/_common/components/post/post.styl \
    && mv -f /tmp/hexo/post.styl /usr/local/opt/hexo/blog/themes/next/source/css/_common/components/post/post.styl \
    && test -z $BLOG_REPOSITORY || git clone --progress $BLOG_REPOSITORY /usr/local/opt/hexo/blog/source/_posts \
    && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 4000
EXPOSE 22

WORKDIR /usr/local/opt/hexo/blog/source/_posts

CMD ["hexo", "server"]