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
    passlib \
    python-jenkins \    
    pyvcloud \
    pyvmomi \
    pywinrm

RUN rm -Rf ~/.pip/cache/

WORKDIR /srv

# Sample port
# EXPOSE 10000

CMD ansible --version