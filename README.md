# Docker
My personal docker study notes

| Service                     | Host                             | Swarm                          |
| --------------------------- | -------------------------------- | ------------------------------ |
| Portainer                   | `40001:9000`  `40002:8000`       | `50001:9000`  `50002:8000`     |
| Portainer-Agent             |                                  | `50003:9001`                   |
| Shadowsocks-Websocket-HTTP  | `40004:9100`  `40004:9100/udp`   | `50004:9100`  `50004:9100/udp` |
| Shadowsocks-Websocket-HTTPS | `40005:9100`  `40005:9100/udp`   | `50005:9100`  `50005:9100/udp` |
|                             |                                  |                                |
| Bark                        | `8080:8080`                      |                                |
| ElasticStack                |                                  |                                |
| FileBeat                    |                                  |                                |
| Frp                         |                                  |                                |
| GitLab                      | `8222:22`  `8181:80`  `8443:443` |                                |
| GitLab-Runner               | -                                |                                |
| Hexo                        | `4000:4000` `4001:22`            |                                |
| Keepalive                   |                                  |                                |
| Minio                       | `9003:9000`                      |                                |
| MySQL                       | `3306:3306`                      |                                |
| Nginx                       | `80:80`  `443:443`               |                                |
| PHP-Nginx                   | `8088:80`                        |                                |
| PHP-56                      | `9002:9000`                      |                                |
| PHP-72                      | `9005:9000`                      |                                |
| PHP-8                       | `9004:9000`                      |                                |
| PostgresSQL                 | `5432:5432`                      |                                |
| Python                      | `9006:8080`                      |                                |
| RabbitMQ                    |                                  |                                |
| Redis                       | `6379:6379`                      |                                |
| Docker Registry             | `5000:5000`                      |                                |
| Shadowsocks-Nginx           | `80:80`  `443:443`               |                                |
| Tomcat                      | `8085:8080`                      |                                |
| Code-Server                 | `8083:8080`                      |                                |

