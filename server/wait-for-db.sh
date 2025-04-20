#!/bin/bash
# wait-for-db.sh

set -e

host="$DB_HOST"
port="${DB_PORT:-3306}"

echo "Waiting for MySQL at $host:$port..."

until nc -z "$host" "$port"; do
  echo "MySQL is unavailable - sleeping"
  sleep 3
done

echo "MySQL is up - executing command"
exec "$@"
