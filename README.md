### About

My personal docker study notes



### Port

| Service                     | Port Changed                                         | Port Keep   | Port Plant                |
| --------------------------- | ---------------------------------------------------- | ----------- | ------------------------- |
| Bark                        | `63801:8080`                                         |             |                           |
|                             |                                                      |             | `63802`  `63803`  `63804` |
| Frp                         | `63805`  `63806`                                     |             |                           |
| GitLab                      | `63807:22`  `63808:80`  `63809:443`                  |             |                           |
| GitLab-Runner               | -                                                    |             |                           |
| Vmware                      | `63810`                                              |             |                           |
| Vmware-Docker               | `63811`                                              |             |                           |
| Vmware-Remote-Desktop       |                                                      |             | `63812:443`               |
| Minio                       | `63814:9000`  `63815:9000` `63816:9000` `63817:9000` |             |                           |
| Minio-Client                | -                                                    |             |                           |
| Portainer                   | `63818:9000`                                         | `8000:8000` |                           |
| Portainer-Edge-Agent        | `63819:80`                                           |             |                           |
|                             |                                                      |             | `63820`                   |
| Shadowsocks-Websocket-HTTP  | `63821:9100`  `63821:9100/udp`                       |             |                           |
| Shadowsocks-Websocket-HTTPS | `63822:9100`  `63822:9100/udp`                       |             |                           |
| Swagger-Editor              | `63823:8080`                                         |             |                           |
| Swagger-UI                  | `63824:8080`                                         |             |                           |
| Hexo                        | `63825:4000` `63826:22`                              |             |                           |
| VSCode                      | `63827:8080`                                         |             |                           |
|                             |                                                      |             |                           |
| ElasticStack                |                                                      |             |                           |
| FileBeat                    | -                                                    |             | -                         |
| Keepalive                   |                                                      |             |                           |
| MySQL                       | `63829:3306`  `63830:3306`                             |             |                           |
| Nginx                       | `80:80`  `443:443`                                   |             |                           |
| PHP-Nginx                   | `8088:80`                                            |             |                           |
| PHP-56                      | `9002:9000`                                          |             |                           |
| PHP-72                      | `9005:9000`                                          |             |                           |
| PHP-8                       | `9004:9000`                                          |             |                           |
| PostgresSQL                 | `5432:5432`                                          |             |                           |
| Python                      | `63828:80`                                           |             |                           |
| RabbitMQ                    |                                                      |             |                           |
| Redis                       | `6379:6379`                                          |             |                           |
| Tomcat                      | `8085:8080`                                          |             |                           |



### Secrets

| Item                       | Description    |
| -------------------------- | -------------- |
| `wildcard-certificate.crt` | 泛域名证书     |
| `wildcard-certificate.key` | 泛域名证书私钥 |

