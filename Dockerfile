FROM ubuntu:latest

RUN apt-get update && apt-get install -y \
    python3.10 \
    python3.10-venv \
    python3.10-dev \
    python3-pip \
    git \
    build-essential \
    libffi-dev \
    && ln -s /usr/bin/python3.10 /usr/bin/python3 \
    && ln -s /usr/bin/pip3 /usr/bin/pip

RUN pip install --upgrade pip

RUN pip install PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
