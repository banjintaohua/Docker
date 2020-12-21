FROM python:3.9.1

WORKDIR /app

COPY src/requirements.txt ./

RUN pip install -r requirements.txt

COPY src /app

EXPOSE 8080

# CMD [ "python", "server.py" ]
CMD [ "tail", "-f", "/dev/null" ]