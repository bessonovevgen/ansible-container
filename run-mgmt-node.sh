#!/bin/bash
docker-compose run --rm ansible \
    bash -c \
    "cp -R ~/keys ~/.ssh/ && \
    chmod 0700 /root/.ssh && \
    chmod 600 /root/.ssh/id_rsa* && \
    bash"
