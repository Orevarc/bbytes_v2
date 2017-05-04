#!/bin/bash

set -e

psql -v ON_ERROR_STOP=1 --username "$POSTGRES_USER" <<-EOSQL
    CREATE USER bbytes WITH PASSWORD 'password' CREATEDB;
    CREATE DATABASE bbytes_dev;
    GRANT ALL PRIVILEGES ON DATABASE bbytes_dev TO bbytes;
EOSQL
