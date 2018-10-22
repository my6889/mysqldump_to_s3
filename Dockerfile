FROM alpine:3.4
RUN apk add --update mysql-client bash openssh-client  \
&& apk add py-pip \
&& pip install awscli --upgrade \
&& rm -rf /var/cache/apk/* \
&& mkdir /mysqldump \
&& chmod -R 777 /mysqldump

ENV AWS_ACCESS_KEY_ID **None**
ENV AWS_SECRET_ACCESS_KEY **None**
ENV AWS_BUCKET **None**

ENV PREFIX **None**


COPY dump.sh /
RUN chmod 777 dump.sh
ENTRYPOINT ["/dump.sh"]
