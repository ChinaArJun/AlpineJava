
# FROM alpine:3.9
FROM frolvlad/alpine-glibc

# author
MAINTAINER ChinaArjun
# install bash
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.9/main/" > /etc/apk/repositories
RUN echo "https://mirror.tuna.tsinghua.edu.cn/alpine/v3.9/main/" > /etc/apk/repositories
RUN apk --update add --no-cache bash
RUN apk --update add bash-doc
RUN apk --update add bash-completion
# 清空缓存
RUN rm -rf /var/cache/apk/*
# RUN apk update \
#     && apk upgrade \
#     && apk add --no-cache bash \
#     bash-doc \
#     bash-completion \
#     && rm -rf /var/cache/apk/* \
#     && /bin/bash

# A streamlined jre
ADD jre8.tar.gz /usr/java/jre/
# timezone
ADD Shanghai /etc/localtime
# set env
ENV JAVA_HOME /usr/java/jre
ENV PATH ${PATH}:${JAVA_HOME}/bin
# run container with base path:/
WORKDIR /

CMD ["java", "-version"]