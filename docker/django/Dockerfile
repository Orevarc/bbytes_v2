FROM python:3.4.3
MAINTAINER Michael Cravero <mjcravero@gmail.com>

ENV PYTHONUNBUFFERED 1
ENV AWS_SECRET_ACCESS_KEY=LAO295n0zlkdP8BivW0X4eThJfHDNU09w345Nr+d
ENV AWS_ACCESS_KEY_ID=AKIAIOTRULZUMOMQAXVQ
ENV AWS_REGION=us-east-2
ENV BUCKET_NAME=bbytes-models

COPY ./docker/django/django-entrypoint.sh /
COPY ./bbytes_server/requirements-dev.txt /django/requirements-dev.txt

WORKDIR /django

RUN pip install pip==9.0.1
RUN pip install -r requirements-dev.txt
RUN pip install --upgrade html5lib==1.0b8

RUN python -m spacy download en


