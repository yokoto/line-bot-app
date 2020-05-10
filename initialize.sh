#!/bin/bash
set -e

psql -v ON_ERROR_STOP=1 --username "postgres" <<-EOSQL
    CREATE USER postgres;
    CREATE DATABASE sampledb;
    GRANT ALL PRIVILEGES ON DATABASE sampledb TO postgres;
EOSQL