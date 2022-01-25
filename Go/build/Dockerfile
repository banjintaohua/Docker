ARG GO_VERSION

FROM golang:${GO_VERSION}-alpine3.11

WORKDIR /app

ENV GOPROXY https://goproxy.cn
ENV GO111MODULE on
# ENV GOOS darwin
# ENV GOARCH amd64
# ENV CGO_ENABLED 0

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk update \
  && apk add git \
  && apk add gcc \
  && apk add libc-dev \
  && git clone https://github.com/go-delve/delve /tmp/delve \
  && cd /tmp/delve/cmd/dlv \
  && go build -o /usr/local/bin/dlv \
  && rm -rf /tmp/*
  # && go build -gcflags="all=-N -l" -o /app/foobar

EXPOSE 2345

CMD ["/usr/local/bin/dlv", "--listen=:2345", "--headless=true", "--check-go-version=false", "--api-version=2", "exec", "/app/foobar"]
