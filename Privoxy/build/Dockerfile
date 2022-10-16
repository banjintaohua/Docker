FROM alpine:3.12

LABEL maintainer="banjintaohua"

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
    && apk --no-cache --update add privoxy

EXPOSE 8118

ENTRYPOINT ["privoxy"]

CMD ["--no-daemon", "/etc/privoxy/config" ]