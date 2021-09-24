FROM python:3.8-slim

ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONUNBUFFERED 1

COPY ./requirements.txt /requirements.txt
RUN apt-get update && apt-get install -y
RUN apt-get install -y gcc libc-dev
RUN pip install --upgrade pip setuptools wheel
RUN pip install -r /requirements.txt
RUN apt-get clean
RUN rm -f /var/lib/apt/list/*

RUN mkdir /src
WORKDIR /src
COPY ./src /src

RUN mkdir -p /src/media
RUN mkdir -p /src/static
RUN mkdir -p /var/log/app
RUN chmod -R 755 /var/log/app
