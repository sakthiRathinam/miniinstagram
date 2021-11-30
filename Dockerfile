FROM python:3.8.0-slim-buster
ENV PYTHONUNBUFFERED=1
WORKDIR /app
# RUN apk update && apk add postgresql-dev gcc python3-dev musl-dev
RUN apt-get update && apt-get install -y \
    python-dev python3-dev gcc libpq-dev curl \
    && pip3 install --upgrade setuptools

RUN python -m pip install --upgrade pip
RUN curl -sSL https://raw.githubusercontent.com/python-poetry/poetry/master/get-poetry.py | POETRY_HOME=/opt/poetry python && \
    cd /usr/local/bin && \
    ln -s /opt/poetry/bin/poetry && \
    poetry config virtualenvs.create false
COPY poetry.lock /app
COPY pyproject.toml /app
RUN poetry install

COPY . /app