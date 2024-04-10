### About

Docker best practice

```
Bark
├── .env
├── build
│   ├── .dockerignore
│   ├── Dockerfile
│   └── entrypoint.sh
├── conf
│   └── localtime
├── data
│   └── bark.db
├── docker-compose.yml
└── docker-stack.yml
```



best practice
1. `.dockerignore`
2. single application
3. `entrypoint.sh` with `exec`
4. `HEALTHCHECK`
5. assign image version
6. clean cache. `rm -rf /tmp/* /var/cache/apk/*`
7. `WORKDIR`
8. `EXPOSE`

### Port

| Service                     | Ports                                    | Port Keep     |
|-----------------------------|------------------------------------------|---------------|
| Bark                        | `58084:8080`                             |               |
| Camunda                     | `58088:8080`                             |               |
| CentOS                      |                                          | -             |
| DBGp                        | `59002:9001`  `59003:9003`               |               |
| ElasticStack                | `59200:9200`  `55601:5601`  `55000:5000` |               |
| FileBeat                    |                                          | -             |
| Frp                         | `57000:7000`  `57500:7500`               |               |
| Frp-Remote-Desktop          | `53389:3389`                             |               |
| GitLab                      | `58080:80`  `50022:22`                   |               |
| GitLab-Runner               |                                          | -             |
| Go                          | `52345:2345`  `58086:8080`               |               |
| Hexo                        | `54000:4000`  `50023:22`                 |               |
| Minio                       | `59005:9000`  `59004:9001`               |               |
| Minio-Client                | -                                        |               |
| MongoDB                     | `57017:27017`                            |               |
| MySQL                       | `53306:3306`  `53307:3306` `53308:3306`  |               |
| NFS                         | -                                        |               |
| Nginx                       | `80:80`  `443:443`                       |               |
| Node                        | `58087:8080`                             |               |
| PHP-56                      | `59006:9000`                             |               |
| PHP-72                      | `59007:9000`                             |               |
| PHP-8                       | `59008:9000`                             |               |
| Portainer                   | `59000:9000`                             | `8000:8000`   |
| Portainer-Edge-Agent        | `59001:9001`                             |               |
| PostgresSQL                 | `55432:5432`                             |               |
| Python                      | `58085:8080`                             |               |
| Qinglong                    | `55700:5700`                             |               |
| RabbitMQ                    | `55672:5672`                             | `15672:15672` |
| Redis                       | `56379:6379`                             |               |
| Registry                    | `55050:443`                              | `55050:5000`  |
| Shadowsocks-Client          | `51079:51079`                            |               |
| Shadowsocks-Websocket-HTTP  | `51080:51080`                            |               |
| Shadowsocks-Websocket-HTTPS | `51081:51081`                            |               |
| Swagger-Editor              | `58081:8080`                             |               |
| Swagger-UI                  | `58082:8080`                             |               |
| VSCode                      | `58083:8080`                             |               |



### Secrets

| Item                       | Description                 |
| -------------------------- |-----------------------------|
| `wildcard-certificate.crt` | wildcard domain certificate |
| `wildcard-certificate.key` | certificate key             |

