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
        if [ "${1#-}" != "$1" ]; then
            set -- php-fpm --force-stderr --nodaemonize "$@"
        fi

        exec "$@"
        ;;
esac
