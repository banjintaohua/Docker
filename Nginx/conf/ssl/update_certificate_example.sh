#!/usr/bin/env bash

containerId=$(docker ps --format "{{.ID}} {{.Names}}" | grep acme | awk '{print $1}')
domain="*.domain.com"

# 检测证书是否过期
if docker exec "$containerId" openssl x509 -checkend 604800 -noout -in /acme.sh/"$domain"_ecc/"$domain".cer; then
    echo "Certificate is good for another day!"
    exit
fi

echo "Certificate has expired or will do so within 7 days"
echo "(or is invalid/not found)"

# 更新证书
docker exec "$containerId" /root/.acme.sh/acme.sh --renew --insecure --force --ecc -d \*.banjintaohua.online

# 删除旧证书
docker exec "$containerId" mkdir -p "/acme.sh/${domain}_ecc/backup"
docker exec "$containerId" rm -f /acme.sh/"${domain}"_ecc/backup/wildcard-certificate.crt /acme.sh/\*.banjintaohua.online_ecc/backup/wildcard-certificate.key
echo "Old certificate has been deleted"
docker exec "$containerId" ls -al /acme.sh/"${domain}"_ecc/backup

# 重新安装证书
echo "reinstall certificate"
docker exec "$containerId" /root/.acme.sh/acme.sh --installcert --ecc -d "$domain" \
  --fullchain-file /acme.sh/"${domain}"_ecc/backup/wildcard-certificate.crt \
  --key-file /acme.sh/"${domain}"_ecc/backup/wildcard-certificate.key

# 重新加载 Nginx 配置
docker cp "$containerId":/acme.sh/"${domain}"_ecc/backup/wildcard-certificate.crt ./
docker cp "$containerId":/acme.sh/"${domain}"_ecc/backup/wildcard-certificate.key ./
# docker exec nginx nginx -s reload

