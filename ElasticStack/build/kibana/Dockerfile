ARG ELK_VERSION

# 官方的镜像在 AWS 上
# https://www.docker.elastic.co/
# FROM docker.elastic.co/kibana/kibana:${ELK_VERSION}

# 官方的经常超时，改为使用 DockerHub 的镜像
# https://hub.docker.com/r/elastic/kibana
FROM elastic/kibana:${ELK_VERSION}

# Add your kibana plugins setup here
# Example: RUN kibana-plugin install <name|url>
