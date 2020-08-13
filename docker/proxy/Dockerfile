FROM nginx:alpine

ARG CONSUL_VERSION
ARG CONSUL_CLUSTER_ENCRYPT

RUN apk update && apk add curl wget jq nano

# install counsul
RUN wget https://releases.hashicorp.com/consul/${CONSUL_VERSION}/consul_${CONSUL_VERSION}_linux_amd64.zip -O /tmp/consul.zip
RUN unzip /tmp/consul.zip -d /tmp
RUN mv /tmp/consul /usr/local/bin/consul

# install consul-template
RUN wget https://releases.hashicorp.com/consul-template/0.25.1/consul-template_0.25.1_linux_amd64.tgz
RUN gzip -d consul-template_0.25.1_linux_amd64.tgz
RUN tar -xvf consul-template_0.25.1_linux_amd64.tar
RUN mv consul-template /usr/local/bin/
RUN mkdir /etc/consul-template.d

# config consul
RUN mkdir /var/consul
RUN mkdir -p /home/consul/dist
ADD files/consul /etc/consul.d/
RUN cat /etc/consul.d/client/config.json.tpl | jq '.encrypt = $encrypt_str' --arg encrypt_str ${CONSUL_CLUSTER_ENCRYPT} > /etc/consul.d/client/config.json

# config nginx
ADD files/nginx /etc/nginx/
RUN rm /etc/nginx/conf.d/default.conf
RUN mv /etc/nginx/conf.d/consul_ui.conf.tpl /etc/nginx/conf.d/consul_ui.conf

# config consul-template
ADD files/consul-template /etc/consul-template.d/

ADD entrypoint.sh /
RUN chmod +x /entrypoint.sh

CMD ["/entrypoint.sh"]
