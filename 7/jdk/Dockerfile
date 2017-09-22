FROM bestwu/alpine-glibc:2.25-r0
LABEL maintainer='Peter Wu <piterwu@outlook.com>'
ENV LANG=C.UTF-8
# jdk-7u80-linux-x64
ADD jdk1.7.0_80.tar.xz /usr/lib/jvm/jdk1.7.0_80
ENV JAVA_HOME=/usr/lib/jvm/jdk1.7.0_80
ENV PATH=$PATH:${JAVA_HOME}/bin