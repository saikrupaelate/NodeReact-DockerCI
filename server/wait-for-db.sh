#!/bin/sh

# wait-for-db.sh

echo "Waiting for MySQL to be ready..."

until mysql -h"$DB_HOST" -u"$DB_USER" -p"$DB_PASSWORD" -e "USE $DB_DATABASE;" > /dev/null 2>&1; do
  echo "MySQL is unavailable - sleeping"
  sleep 2
done

echo "MySQL is up - executing command"
exec "$@"
