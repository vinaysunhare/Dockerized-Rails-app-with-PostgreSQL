#!/bin/bash
set -e
host="$1"
port="$2"
until pg_isready -h "$host" -p "$port"; do
  echo "Waiting for PostgreSQL to be ready on $host:$port..."
  sleep 1
done
echo "PostgreSQL is ready!"
exec "$@"