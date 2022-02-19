#!/usr/bin/env sh

set -e

health_check() {

  if [ "$(curl -f http://localhost:8080)" -ne 0 ]; then
    echo "Application startup failed. Exiting."
    exit 1
  fi

  echo "Application startup successful."
  return 0

}

case "$1" in
"dev")
  /release/dlv --listen=:2345 --headless=true --check-go-version=false --api-version=2 --accept-multiclient exec /release/server || health_check
  ;;

"run")
  /release/server || health_check
  ;;

"health")
  health_check
  ;;

*)
  exec "$@"
  ;;
esac
