#!/usr/bin/env sh

set -e

health_check() {
  # todo
  return 0

}

case "$1" in
"health")
  health_check
  ;;

*)
  exec "$@"
  ;;
esac
