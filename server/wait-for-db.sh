#!/bin/bash
# wait-for-db.sh

set -e

host="${DB_HOST:-mysql}"
port="${DB_PORT:-3306}"
user="${DB_USER:-root}"
password="${DB_PASSWORD:-root}"

echo "Waiting for MySQL at $host:$port..."

until mysql -h "$host" -P "$port" -u "$user" -p"$password" -e "SELECT 1" > /dev/null 2>&1; do
  echo "MySQL is unavailable - sleeping"
  sleep 3
done

echo "MySQL is up - executing command"
exec "$@"