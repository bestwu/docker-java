FROM bestwu/alpine-glibc:2.25-r0
MAINTAINER Peter Wu <piterwu@outlook.com>
ENV LANG=C.UTF-8
# server-jre-8u111-linux-x64
ADD ./jre /opt/jdk/jre
ENV JAVA_HOME=/opt/jdk/jre \
    PATH=$PATH:/opt/jdk/jre/bin