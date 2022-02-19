#!/usr/bin/env bash

set -e

function health_check() {
  curl -f http://localhost:8080/api/ || exit 1

  return 0
}

if [[ -n ${REMOTE_URL} ]]; then
  git clone --progress "${REMOTE_URL}" /var/www/app
fi

cd /var/www/app

case "$1" in
"dev")
  health_check
  poetry run uvicorn --host=0.0.0.0 --port 8080 app.main:app --reload
  ;;

"debug")
  # 需要先在 Pycharm 中启用 Debug Server
  health_check
  poetry run uvicorn --host=0.0.0.0 --port 8080 app.main_debug:app --reload
  ;;

"run")
  poetry run uvicorn --host=0.0.0.0 --port 8080 app.main:app
  ;;

"health")
  health_check
  ;;

*)
  exec "$@"
  ;;

esac
