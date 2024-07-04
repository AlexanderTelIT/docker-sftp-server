FROM alpine:3.6
USER root
EXPOSE 2022

VOLUME ["/data"]
ENV poll_users=true

RUN apk add --no-cache openssh openssh-sftp-server
COPY config/sshd_config /etc/ssh/sshd_config
COPY bin/* /usr/local/bin/


RUN mkdir  /data/server
RUN mkdir  /data/users
RUN mkdir  /data/userdata

RUN chown -R 7777 /data



RUN chmod -R 755 /data


RUN chmod -R 7777 /usr/
RUN chmod -R 7777 /var/run/
RUN chmod -R 7777 /etc
RUN chmod -R 7777 /etc/passwd
RUN chmod -R 7777 data/

ENTRYPOINT ["/usr/local/bin/setup_environment"]

