#!/bin/sh

echo "Waiting for the database..."

until pg_isready -h postgres -p 5432; do
  echo "Database is not ready, checking again in 2 seconds"
  sleep 2
done

echo "Database is ready!"