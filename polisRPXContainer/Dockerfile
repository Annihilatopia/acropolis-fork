FROM ubuntu:16.04

RUN apt-get update && apt-get install -y nginx

# Setup rpx to client and admin server via nginx
COPY default /etc/nginx/sites-available
COPY nginx.conf /etc/nginx

EXPOSE 5003
EXPOSE 5004

CMD ["nginx", "-g", "daemon off;"]
