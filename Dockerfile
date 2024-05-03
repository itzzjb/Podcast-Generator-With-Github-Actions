# Controls how the cloud server spinups a container in a VM

FROM ubuntu:latest

RUN apt-get update && \
    apt-get install -y \
    python3.10 \
    python3-pip \
    python3-venv \
    git

# Create a virtual environment
RUN python3 -m venv /venv

# Install PyYAML within the virtual environment
RUN /venv/bin/pip install PyYAML

COPY feed.py /usr/bin/feed.py
COPY entrypoint.sh /entrypoint.sh

ENTRYPOINT ["/entrypoint.sh"]
