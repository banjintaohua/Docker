FROM gitlab/gitlab-runner

LABEL maintainer="fjxzyx@gmail.com"

ENV USER gitlab-runner

RUN ssh-keygen -t rsa -P "" -f /etc/ssh/id_rsa \
    && chown $USER:$USER /etc/ssh/id_rsa \
    && echo "StrictHostKeyChecking no" >> etc/ssh/config \
    && echo "UserKnownHostsFile /dev/null" >> etc/ssh/config

WORKDIR /etc/ssh/
