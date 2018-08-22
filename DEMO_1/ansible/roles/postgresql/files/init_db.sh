#! /bin/bash

# Check if data directory is empty. If true then initialize database
if ! [ "$(ls -A /var/lib/pgsql/10/data)" ]; then
  sudo /usr/pgsql-10/bin/postgresql-10-setup initdb
else
  echo "Database already initialized"
fi