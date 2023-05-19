#!/bin/sh

set -e

python manage.py collectstatic --noinput
python manage.py migrate

gunicorn --bind "0.0.0.0:6060" Indreniv2.wsgi:application
