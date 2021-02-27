FROM alpine:3.12

LABEL maintainer="example@mail.com"

ARG FRP_VERSION
ARG OS
ARG ARCH

RUN cd /home \
    && wget --no-check-certificate -c https://github.com/fatedier/frp/releases/download/v${FRP_VERSION}/frp_${FRP_VERSION}_${OS}_${ARCH}.tar.gz -O frp.tar.gz \
    && tar xvzf frp.tar.gz \
    && cd frp_${FRP_VERSION}_${OS}_${ARCH} \
    && cp frps frpc /usr/bin/ \
    && mkdir -p /etc/frp /var/log/frp \
    && cp frps.ini frpc.ini /etc/frp \
    && cd /etc/frp \
    && rm -rf /home/frp_${FRP_VERSION}_${OS}_${ARCH}

EXPOSE 6000

CMD ["tail", "-f", "/dev/null" ]