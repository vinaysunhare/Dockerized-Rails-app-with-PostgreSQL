#!/bin/bash
set -e

# Wait for DB to be ready (optional if you're using wait-for-db.sh instead)
# until pg_isready -h db -p 5432 -U postgres; do
#   echo "⏳ Waiting for Postgres..."
#   sleep 2
# done

# Migrate database
echo "🔁 Running migrations..."
bundle exec rails db:migrate

# Start app
exec "$@"
