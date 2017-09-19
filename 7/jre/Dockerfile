FROM bestwu/alpine-glibc:2.25-r0
LABEL maintainer='Peter Wu <piterwu@outlook.com>'
ENV LANG=C.UTF-8
# server-jre-7u80-linux-x64
ADD jdk1.7.0_80.tar.xz /opt/jdk
ENV JAVA_HOME=/opt/jdk \
    PATH=$PATH:/opt/jdk/bin