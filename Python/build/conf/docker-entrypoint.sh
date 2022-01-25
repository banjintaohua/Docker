#!/usr/bin/env bash

# 切换到项目目录
cd /var/www/app

case "$1" in
  "dev" )
    poetry run uvicorn --host=0.0.0.0 --port 80 app.main:app --reload
    ;;

  "debug" )
    # 需要先在 Pycharm 中启用 Debug Server
    poetry run uvicorn --host=0.0.0.0 --port 80 app.main_debug:app --reload
    ;;

  "run" )
    poetry run uvicorn --host=0.0.0.0 --port 80 app.main:app
    ;;

   * )
    exec "$@"
    ;;
esac