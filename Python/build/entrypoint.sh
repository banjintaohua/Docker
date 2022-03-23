#!/usr/bin/env bash

set -e

function health_check() {

  if [ "$(curl -f http://localhost:8080/api/)" -ne 0 ]; then
    echo "Application startup failed. Exiting."
    exit 1
  fi

  echo "Application startup successful."
  return 0

}

if [[ -n ${REMOTE_URL} ]]; then
  git clone --progress "${REMOTE_URL}" /var/www/app
fi

cd /var/www/app

case "$1" in
"dev")
  exec poetry run uvicorn --host=0.0.0.0 --port 8080 app.main:app --reload
  ;;

"debug")
  # 需要先在 Pycharm 中启用 Debug Server
  exec poetry run uvicorn --host=0.0.0.0 --port 8080 app.main_debug:app --reload
  ;;

"run")
  exec poetry run uvicorn --host=0.0.0.0 --port 8080 app.main:app || health_check
  ;;

*)
  exec "$@"
  ;;

esac
