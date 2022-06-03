FROM python:3.7-slim

WORKDIR /demo

COPY . /demo

EXPOSE 8002

RUN apt update && apt install -y \
    curl \
    vim \
    net-tools \
    procps \
    && pip install fastapi uvicorn[standard] \
    && rm -rf /var/lib/apt/lists/*

CMD ["uvicorn","main:app","--reload","--port=8002","--host=0.0.0.0" ]


