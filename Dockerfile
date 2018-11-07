FROM ubuntu:16.04

LABEL maintainer="evgen@ievgen.ru"
LABEL NAME="ansible in docker"
LABEL VERSION="0.1"

RUN apt-get update && \
    apt-get dist-upgrade -yq

RUN apt-get install -yq \
    git \
    curl \
    iputils-ping \
    libffi-dev \
    libssl-dev \
    libyaml-dev \
    python \
    python-dev \
    python-pip \
    sshpass \
    whois && \
    apt-get clean

RUN pip install --upgrade pip

RUN pip install \
    ansible==2.5 \
    grafana-api-client==0.2.0 \
    lxml==4.2.3 \
    passlib \
    python-jenkins==1.1.0 \
    pyvcloud \
    pyvmomi \
    pywinrm \
    requests==2.19.1 \
    zabbix-api==0.5.3

RUN rm -Rf ~/.pip/cache/

WORKDIR /srv

# Sample port
# EXPOSE 10000

CMD ansible --version