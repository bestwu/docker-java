FROM alpine:latest
MAINTAINER Peter Wu <piterwu@outlook.com>
ENV LANG=C.UTF-8
    JAVA_PACKAGE=server-jre \
    JAVA_VERSION_MAJOR=7 \
    JAVA_VERSION_MINOR=80 \
    JAVA_VERSION_BUILD=15 \
    GLIBC_PKG_VERSION=2.25-r0 \
WORKDIR /tmp
RUN apk add --no-cache --update-cache curl ca-certificates && \
  curl -Lo /etc/apk/keys/sgerrand.rsa.pub "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/sgerrand.rsa.pub" && \
  curl -Lo glibc-${GLIBC_PKG_VERSION}.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-${GLIBC_PKG_VERSION}.apk" && \
  apk add glibc-${GLIBC_PKG_VERSION}.apk&& \
  curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz" | gunzip -c - | tar -xf - && \
  apk del curl ca-certificates && \
  mv jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}/jre /opt/jdk/jre && \

  rm -rf /opt/jdk/jre/plugin \
         /opt/jdk/jre/bin/javaws \
         /opt/jdk/jre/bin/jjs \
         /opt/jdk/jre/bin/keytool \
         /opt/jdk/jre/bin/orbd \
         /opt/jdk/jre/bin/pack200 \
         /opt/jdk/jre/bin/policytool \
         /opt/jdk/jre/bin/rmid \
         /opt/jdk/jre/bin/rmiregistry \
         /opt/jdk/jre/bin/servertool \
         /opt/jdk/jre/bin/tnameserv \
         /opt/jdk/jre/bin/unpack200 \
         /opt/jdk/jre/lib/applet \
         /opt/jdk/jre/lib/javaws.jar \
         /opt/jdk/jre/lib/deploy* \
         /opt/jdk/jre/lib/desktop \
         /opt/jdk/jre/lib/*javafx* \
         /opt/jdk/jre/lib/*jfx* \
         /opt/jdk/jre/lib/amd64/libdecora_sse.so \
         /opt/jdk/jre/lib/amd64/libprism_*.so \
         /opt/jdk/jre/lib/amd64/libfxplugins.so \
         /opt/jdk/jre/lib/amd64/libglass.so \
         /opt/jdk/jre/lib/amd64/libgstreamer-lite.so \
         /opt/jdk/jre/lib/amd64/libjavafx*.so \
         /opt/jdk/jre/lib/amd64/libjfx*.so \
         /opt/jdk/jre/lib/ext/jfxrt.jar \
         /opt/jdk/jre/lib/ext/nashorn.jar \
         /opt/jdk/jre/lib/oblique-fonts \
         /opt/jdk/jre/lib/plugin.jar \
         /opt/jdk/jre/lib/jfr \
         /opt/jdk/jre/lib/jfr.jar \
         /opt/jdk/jre/Welcome.html \
         /tmp/* /var/cache/apk/*

ENV JAVA_HOME=/opt/jdk/jre \
    PATH=$PATH:/opt/jdk/jre/bin