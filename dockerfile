FROM ubuntu:latest

RUN apt-get update && apt-get install -y nginx

EXPOSE 80

COPY index.html /usr/share/nginx/html/

CMD ["nginx", "-g", "daemon off;"]