#!/bin/bash
set -e

# Wait for DB (optional if using wait-for-db.sh)
# until pg_isready -h db -p 5432 -U postgres; do
#   echo "⏳ Waiting for Postgres..."
#   sleep 2
# done

# Migrate database
echo "🔁 Running migrations..."
bundle exec rails db:migrate

# Start app on all interfaces (very important!)
echo "🚀 Starting Rails server..."
exec rails server -b 0.0.0.0
