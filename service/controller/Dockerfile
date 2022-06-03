FROM python:3.7-slim

WORKDIR /demo

COPY . /demo

EXPOSE 8003

RUN pip install fastapi uvicorn[standard] \
    && pip install kubernetes

CMD ["uvicorn","main:app","--reload","--port=8003","--host=0.0.0.0" ]


