#escape=`
FROM nginx

MAINTAINER Ahrigray <ahrigray@student.21-school.ru>
WORKDIR /

RUN apt-get update && `
    apt-get install -y spawn-fcgi libfcgi0ldbl && `
    rm -rf /var/lib/apt/lists/*
	
COPY nginx.conf /etc/nginx/
COPY server /server
COPY run_server.sh /run_server.sh 

USER nginx

ENV DOCKER_CONTENT_TRUST=1

HEALTHCHECK NONE

CMD ["bash", "./run_server.sh"]