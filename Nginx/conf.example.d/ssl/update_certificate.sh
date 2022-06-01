#!/usr/bin/env bash

# 检测证书是否过期
if openssl x509 -checkend 604800 -noout -in /root/.acme.sh/\*.domain.com/\*.domain.com.cer; then
    echo "Certificate is good for another day!"
    exit
fi

echo "Certificate has expired or will do so within 7 days"
echo "(or is invalid/not found)"

# 更新证书
/root/.acme.sh/acme.sh --renew --insecure --force --ecc -d \*.jiong.link

# 删除旧证书
rm -f /home/docker/Nginx/conf/ssl/wildcard-certificate.crt /home/docker/Nginx/conf/ssl/wildcard-certificate.key
echo "Old certificate has been deleted"
ls -al /home/docker/Nginx/conf/ssl

# 重新安装证书
echo "reinstall certificate"
/root/.acme.sh/acme.sh --installcert --ecc -d \*.domain.com --fullchain-file /home/docker/Nginx/conf/ssl/wildcard-certificate.crt --key-file /home/docker/Nginx/conf/ssl/wildcard-certificate.key

# 重新加载 Nginx 配置
docker exec nginx nginx -s reload

