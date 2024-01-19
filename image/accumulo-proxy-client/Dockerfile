FROM python:2.7

RUN apt update; \
    apt install -y iproute2 build-essential wget netcat vim pipenv python2.7;

RUN mkdir -p /opt/proxy-client/src/main/python
COPY python_proxy_src/* /opt/proxy-client/src/main/python/.
WORKDIR /opt/proxy-client

RUN git clone https://github.com/apache/accumulo-proxy.git

RUN pipenv --python 2.7; \
    pipenv install thrift; \
    pipenv install -e /opt/proxy-client/accumulo-proxy/src/main/python;

WORKDIR /opt/proxy-client