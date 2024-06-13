FROM camunda/camunda-bpm-platform:tomcat-7.21.0

LABEL maintainer="banjintaohua"

# 删掉没有使用的应用，只保留 camunda 和 engine-rest
RUN /bin/rm -rf /camunda/webapps/ROOT \
    /camunda/webapps/camunda-invoice \
    /camunda/webapps/camunda-welcome \
    /camunda/webapps/docs \
    /camunda/webapps/examples \
    /camunda/webapps/host-manager \
    /camunda/webapps/manager
