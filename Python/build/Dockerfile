FROM python:3.9.1

WORKDIR /var/www/app

COPY . /tmp/build

RUN mv /tmp/build/entrypoint.sh /usr/local/bin/entrypoint.sh \
    && chmod +x /usr/local/bin/entrypoint.sh \
    && mkdir /root/.pip/ \
    && mv /tmp/build/fastapi/pip.conf /root/.pip/ \
    && cd /tmp/build/fastapi \
    && pip install poetry==1.1.9 \
    && poetry config virtualenvs.create false --local \
    # && poetry install --no-dev \
    && poetry install \
    && rm -rf /tmp/*

ENTRYPOINT ["entrypoint.sh"]

EXPOSE 8080