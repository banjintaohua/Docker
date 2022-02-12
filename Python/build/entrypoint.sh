#!/usr/bin/env bash

set -e

if [[  -n ${REMOTE_URL}  ]]; then
  git clone --progress "${REMOTE_URL}" /var/www/app
fi

cd /var/www/app

case "$1" in
  "dev" )
    poetry run uvicorn --host=0.0.0.0 --port 8080 app.main:app --reload
    ;;

  "debug" )
    # 需要先在 Pycharm 中启用 Debug Server
    poetry run uvicorn --host=0.0.0.0 --port 8080 app.main_debug:app --reload
    ;;

  "run" )
    poetry run uvicorn --host=0.0.0.0 --port 8080 app.main:app
    ;;

   * )
    exec "$@"
    ;;
esac