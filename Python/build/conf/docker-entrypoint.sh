#!/usr/bin/env bash

# 切换到项目目录
cd /var/www/app

case "$1" in
  "dev" )
    exec poetry run uvicorn --host=0.0.0.0 --port 80 app.main:app --reload
    ;;

  "debug" )
    exec poetry run uvicorn --host=0.0.0.0 --port 80 app.main_debug:app --reload
    ;;

  "run" )
    exec poetry run uvicorn --host=0.0.0.0 --port 80 app.main:app
    ;;

   * )
    exec "$@"
    ;;
esac