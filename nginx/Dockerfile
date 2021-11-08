FROM nginx:1.21.3-alpine
COPY ./conf.d/host.conf.tpl /host.conf.tpl

ARG HOST
ARG HOST_GID
ARG HOST_UID
ARG HOST_USER
ARG HOST_GROUP

RUN envsubst '$HOST' < /host.conf.tpl > /etc/nginx/conf.d/host.conf

RUN addgroup --gid $HOST_GID $HOST_GROUP
RUN adduser --disabled-password --gecos '' --uid $HOST_UID -G $HOST_GROUP $HOST_USER
#USER $HOST_USER

#CMD ["/bin/sh" , "-c" , "envsubst '$$HOST' < /host.conf.tpl > /etc/nginx/conf.d/host.conf && exec nginx -g 'daemon off;'"]

CMD ["/bin/sh" , "-c" , "exec nginx -g 'daemon off;'"]