FROM nginx:alpine

ARG CONSUL_VERSION
ARG CONSUL_CLUSTER_ENCRYPT

RUN apk update && apk add curl wget jq nano

# install counsul
RUN wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -O /tmp/consul.zip
RUN unzip /tmp/consul.zip -d /tmp
RUN mv /tmp/consul /usr/local/bin/consul

# config consul
RUN mkdir /var/consul
RUN mkdir -p /home/consul/dist
ADD files/consul /etc/consul.d/
RUN cat /etc/consul.d/client/config.json.tpl | jq '.encrypt = $encrypt_str' --arg encrypt_str ${CONSUL_CLUSTER_ENCRYPT} > /etc/consul.d/client/config.json

# config nginx
COPY files/nginx /etc/nginx/
RUN mv /etc/nginx/conf.d/application.conf.tpl /etc/nginx/conf.d/default.conf

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
