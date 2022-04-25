ARG ELK_VERSION

# 官方的镜像在 AWS 上
# https://www.docker.elastic.co/
# FROM docker.elastic.co/logstash/logstash:${ELK_VERSION}

# 官方的经常超时，改为使用 DockerHub 的镜像
# https://hub.docker.com/r/elastic/logstash
FROM elastic/logstash:${ELK_VERSION}

# Add your logstash plugins setup here
# Example: RUN logstash-plugin install logstash-filter-json

LABEL maintainer="banjintaohua"