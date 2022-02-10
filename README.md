### About

My personal docker study notes



### Port

| Service                     | Ports              | Port Keep                               |
| --------------------------- | ------------------ | --------------------------------------- |
| Bark                        | `58080:8080`       |                                         |
| DBGp                        |                    | `59001:9001`  `59003:9003`              |
| ElasticStack                |                    |                                         |
| FileBeat                    |                    | -                                       |
| Frp                         |                    | `63805`  `63806`                        |
| Vmware                      |                    | `63810`                                 |
| Vmware-Docker               |                    | `63811`                                 |
| Vmware-Remote-Desktop       |                    | `63812:443`                             |
| GitLab                      |                    | `63807:22`  `63808:80`  `63809:443`     |
| GitLab-Runner               |                    | -                                       |
| Go                          |                    |                                         |
| Hexo                        |                    | `63825:4000` `63826:22`                 |
| Minio                       | `59005:9000`       | `59006`                                 |
| Minio-Client                |                    | -                                       |
| MongoDB                     |                    |                                         |
| MySQL                       |                    | `63829:3306`  `63830:3306` `63831:3306` |
| Nginx                       | `80:80`  `443:443` |                                         |
| Node                        |                    |                                         |
| PHP-56                      |                    | `9002:9000`                             |
| PHP-72                      |                    | `9005:9000`                             |
| PHP-8                       |                    | `9004:9000`                             |
| Portainer                   | `59000:9000`       | `8000:8000`                             |
| Portainer-Edge-Agent        | `59001:9001`       |                                         |
| PostgresSQL                 |                    | `5432:5432`                             |
| Python                      |                    | `63828:80`                              |
| RabbitMQ                    |                    | `63851:15672`  `63852:5672`             |
| Redis                       |                    | `63841:6379`                            |
| Shadowsocks-Client          | `51079:51079`      |                                         |
| Shadowsocks-Websocket-HTTP  | `51080:51080`      |                                         |
| Shadowsocks-Websocket-HTTPS | `51081:51081`      |                                         |
| Swagger-Editor              | `58081:8080`       |                                         |
| Swagger-UI                  | `58082:8080`       |                                         |
| Tomcat                      |                    | `8085:8080`                             |
| VSCode                      | `58083:8080`       |                                         |



### Secrets

| Item                       | Description    |
| -------------------------- | -------------- |
| `wildcard-certificate.crt` | 泛域名证书     |
| `wildcard-certificate.key` | 泛域名证书私钥 |

