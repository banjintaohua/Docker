FROM alpine:3.12

LABEL maintainer="banjintaohua"

COPY ./entrypoint.sh /usr/local/bin

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk add --update --no-cache nfs-utils bash tzdata \
    # NFSv4 \
    # http://wiki.linux-nfs.org/wiki/index.php/Nfsv4_configuration
    && mkdir -p /var/lib/nfs/rpc_pipefs  \
    && mkdir -p /var/lib/nfs/v4recovery \
    && echo "rpc_pipefs  /var/lib/nfs/rpc_pipefs  rpc_pipefs  defaults  0  0" >> /etc/fstab \
    && echo "nfsd        /proc/fs/nfsd            nfsd        defaults  0  0" >> /etc/fstab \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 2049

ENTRYPOINT ["/usr/local/bin/entrypoint.sh"]