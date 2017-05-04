FROM python:3.4.3
MAINTAINER Michael Cravero <mjcravero@gmail.com>

ENV PYTHONUNBUFFERED 1

COPY ./docker/django/django-entrypoint.sh /
COPY ./server/requirements-dev.txt /django/requirements-dev.txt

WORKDIR /django

RUN pip install pip==9.0.1
RUN pip install -r requirements-dev.txt
