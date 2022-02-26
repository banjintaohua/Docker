FROM alpine:3.12

LABEL maintainer="example"

ENV IDE_PORT=9001
ENV DEBUG_PORT=9003

# 在 XDebug 官网下载 Go 版本实现的 DBGp 代理
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --update --no-cache libc6-compat tzdata \
    && wget -O /usr/bin/dbgpProxy https://xdebug.org/files/binaries/dbgpProxy \
    && chmod 755 /usr/bin/dbgpProxy \
    && rm -rf /tmp/* /var/cache/apk/*

ENTRYPOINT ["/bin/sh", "-c", "/usr/bin/dbgpProxy --server 0.0.0.0:${DEBUG_PORT} --client 0.0.0.0:${IDE_PORT}"]

EXPOSE ${IDE_PORT} ${DEBUG_PORT}