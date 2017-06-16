FROM bestwu/alpine-glibc:2.25-r0
MAINTAINER Peter Wu <piterwu@outlook.com>
ENV LANG=C.UTF-8
# jdk-7u80-linux-x64
ADD ./jdk1.7.0_80 /opt/jdk
ENV JAVA_HOME=/opt/jdk \
    PATH=$PATH:/opt/jdk/bin