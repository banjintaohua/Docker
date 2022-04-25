ARG ELK_VERSION

# 官方的镜像在 AWS 上
# https://www.docker.elastic.co/
# FROM docker.elastic.co/elasticsearch/elasticsearch:${ELK_VERSION}

# 官方的经常超时，改为使用 DockerHub 的镜像
# https://hub.docker.com/r/elastic/elasticsearch
FROM elastic/elasticsearch:${ELK_VERSION}

# Add your elasticsearch plugins setup here
# Example: RUN elasticsearch-plugin install analysis-icu

LABEL maintainer="banjintaohua"