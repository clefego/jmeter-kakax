FROM python:2.7

WORKDIR /files

COPY droopy.py /
COPY avatar.png /

EXPOSE 8000
EXPOSE 8001

RUN apt update && apt install -y \
    curl \
    vim \
    net-tools \
    procps \
    && pip install droopy \
    && rm -rf /var/lib/apt/lists/*



