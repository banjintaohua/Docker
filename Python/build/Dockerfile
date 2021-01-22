FROM python:3.9.1

WORKDIR /app

COPY conf/pip.conf ~/.pip/
COPY conf/requirements.txt ./

RUN pip install -r requirements.txt

COPY app /app

EXPOSE 8080

# CMD [ "python", "server.py" ]
CMD [ "tail", "-f", "/dev/null" ]