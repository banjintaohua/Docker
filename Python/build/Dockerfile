FROM python:3.9.1

WORKDIR /var/www/app

COPY . /tmp/build

RUN mkdir /root/.pip/ \
    && mv /tmp/build/conf/pip.conf /root/.pip/ \
    && mv /tmp/build/conf/docker-entrypoint.sh /usr/local/bin/ \
    && chmod +x /usr/local/bin/docker-entrypoint.sh \
    && cd /tmp/build/conf \
    && pip install -r requirements.txt \
    && poetry config virtualenvs.create false --local \
    && poetry install \
    && rm -rf /tmp/build

ENTRYPOINT ["docker-entrypoint.sh"]

CMD [ "tail", "-f", "/dev/null" ]

EXPOSE 80