FROM python:3.7-slim

WORKDIR /files

COPY . /files

EXPOSE 8004

RUN pip install fastapi uvicorn[standard] \
    && pip install kubernetes \
    && pip install python-multipart

CMD ["uvicorn","main:app","--reload","--port=8004","--host=0.0.0.0" ]


