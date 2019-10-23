FROM mhart/alpine-node:12

COPY ./ /usr/local/opt/hexo-tmp/

RUN apk add --no-cache git \
    && rm -rf /tmp/* /var/cache/apk/* \
    && npm install -g hexo-cli \
    && mkdir -p /usr/local/opt/hexo \
    && cd /usr/local/opt/hexo \
    && hexo init /usr/local/opt/hexo \
    && mv -f /usr/local/opt/hexo-tmp/config/_config.yml /usr/local/opt/hexo/ \
    && rm -rf /usr/local/opt/hexo/source \
    && mv /usr/local/opt/hexo-tmp/source /usr/local/opt/hexo/source \
    && npm install hexo-auto-category --save \
    && npm install hexo-generator-searchdb --save \
    && npm install hexo-deployer-git --save \
    && git clone https://github.com/theme-next/hexo-theme-next /usr/local/opt/hexo/themes/next \
    && mv -f /usr/local/opt/hexo-tmp/config/next/_config.yml /usr/local/opt/hexo/themes/next/ \
    && mv -f /usr/local/opt/hexo-tmp/config/next/site-overview.swig /usr/local/opt/hexo/themes/next/layout/_partials/sidebar/site-overview.swig \
    && mv -f /usr/local/opt/hexo-tmp/config/next/post.styl /usr/local/opt/hexo/themes/next/source/css/_common/components/post/post.styl \
    && mv -f /usr/local/opt/hexo-tmp/config/next/zh-CN.yml /usr/local/opt/hexo/themes/next/languages/zh-CN.yml

WORKDIR /usr/local/opt/hexo

EXPOSE 4000

CMD ["hexo", "server"]


