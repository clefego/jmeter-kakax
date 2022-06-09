FROM node:17.9.1-slim

WORKDIR /app

COPY . /app

RUN yarn install && yarn serve



FROM nginx
RUN mkdir /app
COPY --from=0 /app/dist /app
COPY nginx.conf /etc/nginx/nginx.conf