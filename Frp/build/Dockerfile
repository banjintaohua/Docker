FROM alpine:3.12

LABEL maintainer="example"

ARG FRP_VERSION
ARG OS
ARG ARCH

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --update --no-cache tzdata \
    && cd /tmp \
    && wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_${OS}_${ARCH}.tar.gz -O frp.tar.gz \
    && tar xvzf frp.tar.gz \
    && cd frp_${FRP_VERSION}_${OS}_${ARCH} \
    && cp frps frpc /usr/bin/ \
    && mkdir -p /etc/frp /var/log/frp \
    && cp frps.ini frpc.ini /etc/frp \
    && cd /etc/frp \
    && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 7000 7500

CMD ["tail", "-f", "/dev/null" ]