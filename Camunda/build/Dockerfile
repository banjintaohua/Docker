FROM camunda/camunda-bpm-platform:tomcat-7.10.0

ENV DB_VALIDATE_ON_BORROW=true
ENV DB_VALIDATION_QUERY="SELECT 1"

# 删掉没有使用的应用
RUN /bin/rm -rf /camunda/webapps/camunda-invoice \
           /camunda/webapps/examples \
           /camunda/webapps/h2 \
           /camunda/webapps/ROOT \
           /camunda/webapps/camunda-welcome \
           /camunda/webapps/host-manager \
           /camunda/webapps/manager \
           /camunda/webapps/docs