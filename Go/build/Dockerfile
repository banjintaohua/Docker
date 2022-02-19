# stage1: Build Delve
ARG GO_VERSION
FROM golang:${GO_VERSION:-1.17.3-alpine} AS delve

# ENV GOOS darwin
# ENV GOARCH amd64
# ENV CGO_ENABLED 0
ENV GOPROXY https://goproxy.cn
ENV GO111MODULE on

# 对于 1.16 版本前的 Go 需要通过编译源码的方式安装 delve
# https://github.com/go-delve/delve/tree/master/Documentation/installation
#
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk update \
  && apk add git \
  && apk add gcc \
  && apk add libc-dev \
  && go install github.com/go-delve/delve/cmd/dlv@latest \
  && rm -rf /tmp/* /var/cache/apk/*



# stage2: Build server
FROM delve AS builder

# Multiple copy statements also should not be an issue in this stage
#
#COPY --from=delve /go/bin/dlv /release/dlv
#COPY --from=delve /foo/bar /foo/bar
#
COPY --from=delve /go/bin/dlv /release/dlv

ADD . /build

WORKDIR /build/source/

RUN go build -gcflags="all=-N -l" -o /release/server \
    && cp /build/entrypoint.sh /release/entrypoint.sh \
    && chmod +x /release/entrypoint.sh



# stage3: run server with dlv
# FROM centos:7 as runner
# FROM scratch as runner
FROM golang:${GO_VERSION:-1.17.3-alpine} as runner

WORKDIR /

COPY --from=builder /release /release

# Health check by curl
RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.aliyun.com/g' /etc/apk/repositories \
  && apk update \
  && apk add curl \
  && rm -rf /tmp/* /var/cache/apk/*

EXPOSE 2345 8080

# CMD ["/release/dlv", "--listen=:2345", "--headless=true", "--check-go-version=false", "--api-version=2", "--accept-multiclient", "exec", "/release/server"]
ENTRYPOINT ["/release/entrypoint.sh"]
