#!/usr/bin/env sh

set -e

test -d /usr/local/opt/hexo/blog/source/_posts/.git || git clone --progress "${REMOTE_URL}" /usr/local/opt/hexo/blog/source/_posts

rm -f /usr/local/opt/hexo/blog/source/_posts/package.json

cd /usr/local/opt/hexo/blog/source
/usr/local/bin/hexo clean
/usr/local/bin/hexo generate "${HEXO_DEBUG}"
nohup /usr/local/bin/hexo server 2>&1 &

/usr/sbin/sshd -D