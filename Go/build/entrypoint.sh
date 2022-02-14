#!/usr/bin/env sh

set -e

case "$1" in
  "dev" )
    /release/dlv --listen=:2345 --headless=true --check-go-version=false --api-version=2 --accept-multiclient exec /release/server
    ;;

  "run" )
    /release/server
    ;;

   * )
    exec "$@"
    ;;
esac