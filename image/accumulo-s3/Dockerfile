FROM openjdk:11

RUN apt update; \
    apt install -y iproute2 build-essential wget netcat vim;

ENV ACCUMULO_VERSION=2.1.0
ENV HADOOP_VERSION=3.3.0
ENV ZOOKEEPER_VERSION=3.8.1
ENV ACCUMULO_HOME=/opt/accumulo
ENV HADOOP_HOME=/opt/accumulo
ENV ZOOKEEPER_HOME=/opt/zookeeper

ARG ACCUMULO_RELEASE_URL=https://github.com/Accumulo-S3/accumulo/releases/download/rel%2F2.1.0-s3/accumulo-${ACCUMULO_VERSION}-bin.tar.gz
ARG ZOOKEEPER_RELEASE_URL=https://downloads.apache.org/zookeeper/zookeeper-${ZOOKEEPER_VERSION}/apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz

WORKDIR /tmp

# download and install accumulo along with its hadoop+zookeeper dependencies
RUN wget ${ACCUMULO_RELEASE_URL}; \
    wget ${ZOOKEEPER_RELEASE_URL}; \
    tar -xf accumulo-${ACCUMULO_VERSION}-bin.tar.gz; \
    tar -xf apache-zookeeper-${ZOOKEEPER_VERSION}-bin.tar.gz; \
    mv accumulo-${ACCUMULO_VERSION} ${ACCUMULO_HOME}; \
    mv apache-zookeeper-${ZOOKEEPER_VERSION}-bin ${ZOOKEEPER_HOME};

# cleanup downloaded tar files
RUN rm -rf /tmp/*;

# build native binaries
RUN ${ACCUMULO_HOME}/bin/accumulo-util build-native

WORKDIR ${ACCUMULO_HOME}