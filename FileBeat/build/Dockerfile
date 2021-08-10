ARG ELK_VERSION

# 官方的镜像在 AWS 上
# https://www.docker.elastic.co/
# FROM docker.elastic.co/beats/filebeat:${ELK_VERSION}

# 官方的经常超时，改为使用 DockerHub 的镜像
# https://hub.docker.com/r/elastic/filebeat
FROM elastic/filebeat:${ELK_VERSION}
