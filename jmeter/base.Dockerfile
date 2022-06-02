FROM beevelop/java:v2021.06.2

WORKDIR /

COPY ./apache-jmeter-5.4.3 /apache-jmeter-5.4.3


EXPOSE 1099


RUN apt update && apt install -y \
    wget \
    unzip \
    vim \
    curl \
    inetutils-ping \
    && rm -rf /var/lib/apt/lists/*
