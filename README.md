### About

My personal docker study notes



### Port

| Service                     | Ports                                   | Port Keep                           |
| --------------------------- | --------------------------------------- | ----------------------------------- |
| Bark                        | `58080:8080`                            |                                     |
| DBGp                        | `59002:9001`  `59003:9003`              |                                     |
| ElasticStack                |                                         |                                     |
| FileBeat                    |                                         | -                                   |
| Frp                         | `57000:7000`  `57500:7500`              |                                     |
| Frp-Remote-Desktop          | `53389:3389`                            |                                     |
| GitLab                      |                                         | `63807:22`  `63808:80`  `63809:443` |
| GitLab-Runner               |                                         | -                                   |
| Go                          |                                         |                                     |
| Hexo                        |                                         | `54000:4000` `63826:22`             |
| Minio                       | `59005:9000`                            | `59004`                             |
| Minio-Client                | -                                       |                                     |
| MongoDB                     | `57017:27017`                           |                                     |
| MySQL                       | `53306:3306`  `53307:3306` `53308:3306` |                                     |
| Nginx                       | `80:80`  `443:443`                      |                                     |
| Node                        |                                         |                                     |
| PHP-56                      |                                         | `59006:9000`                        |
| PHP-72                      |                                         | `59007:9000`                        |
| PHP-8                       |                                         | `59008:9000`                        |
| Portainer                   | `59000:9000`                            | `8000:8000`                         |
| Portainer-Edge-Agent        | `59001:9001`                            |                                     |
| PostgresSQL                 |                                         | `55432:5432`                        |
| Python                      |                                         | `58084:8080`                        |
| Qinglong                    | `55700:5700`                            |                                     |
| RabbitMQ                    | `55672:5672`                            | `15672:15672`                       |
| Redis                       | `56379:6379`                            |                                     |
| Shadowsocks-Client          | `51079:51079`                           |                                     |
| Shadowsocks-Websocket-HTTP  | `51080:51080`                           |                                     |
| Shadowsocks-Websocket-HTTPS | `51081:51081`                           |                                     |
| Swagger-Editor              | `58081:8080`                            |                                     |
| Swagger-UI                  | `58082:8080`                            |                                     |
| Tomcat                      |                                         | `58085:8080`                        |
| VSCode                      | `58083:8080`                            |                                     |



### Secrets

| Item                       | Description    |
| -------------------------- | -------------- |
| `wildcard-certificate.crt` | 泛域名证书     |
| `wildcard-certificate.key` | 泛域名证书私钥 |

