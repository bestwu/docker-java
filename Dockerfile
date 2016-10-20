FROM alpine:latest
MAINTAINER Peter Wu <piterwu@outlook.com>
WORKDIR /tmp
RUN JAVA_PACKAGE=server-jre && \
  JAVA_VERSION_MAJOR=8 && \
  JAVA_VERSION_MINOR=112 && \
  JAVA_VERSION_BUILD=15 && \
  GLIBC_PKG_VERSION=2.23-r3 && \
  apk add --no-cache --update-cache curl ca-certificates bash && \
  curl -Lo /etc/apk/keys/sgerrand.rsa.pub "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/sgerrand.rsa.pub" && \
  curl -Lo glibc-${GLIBC_PKG_VERSION}.apk "https://github.com/sgerrand/alpine-pkg-glibc/releases/download/${GLIBC_PKG_VERSION}/glibc-${GLIBC_PKG_VERSION}.apk" && \
  apk add glibc-${GLIBC_PKG_VERSION}.apk&& \
  curl -jksSLH "Cookie: oraclelicense=accept-securebackup-cookie" \
  "http://download.oracle.com/otn-pub/java/jdk/${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-b${JAVA_VERSION_BUILD}/${JAVA_PACKAGE}-${JAVA_VERSION_MAJOR}u${JAVA_VERSION_MINOR}-linux-x64.tar.gz" | gunzip -c - | tar -xf - && \
  apk del curl ca-certificates && \
  mv jdk1.${JAVA_VERSION_MAJOR}.0_${JAVA_VERSION_MINOR}/jre /jre && \
  rm -rf /jre/bin/jjs \
         /jre/bin/keytool \
         /jre/bin/orbd \
         /jre/bin/pack200 \
         /jre/bin/policytool \
         /jre/bin/rmid \
         /jre/bin/rmiregistry \
         /jre/bin/servertool \
         /jre/bin/tnameserv \
         /jre/bin/unpack200 && \
  rm -rf /jre/lib/applet/ \
         /jre/lib/jfr/ \
         /jre/lib/jfr.jar \
         /jre/lib/oblique-fonts/ \
         /jre/lib/ext/nashorn.jar && \
  rm -rf /jre/COPYRIGHT \
         /jre/LICENSE \
         /jre/README \
         /jre/THIRDPARTYLICENSEREADME.txt \
         /jre/Welcome.html && \
  rm -rf /tmp/* /var/cache/apk/*
ENV JAVA_HOME=/jre \
    PATH=$PATH:/jre/bin