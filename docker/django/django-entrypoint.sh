#!/usr/bin/env bash

until cd bbytes_server
do
    echo "Waiting for django volume..."
done

until python manage.py migrate --settings=bbytes.dev_settings
do
    echo "Waiting for postgres ready..."
    sleep 2
done

# python manage.py loaddata fixtures.json --settings=server.bbytes.dev_settings
python manage.py runserver 0.0.0.0:8000 --settings=bbytes.dev_settings
