FROM python:3.7-slim

WORKDIR /demo

COPY . /demo

EXPOSE 8000

RUN pip install fastapi uvicorn[standard]

CMD ["uvicorn","main:app","--reload" ]


