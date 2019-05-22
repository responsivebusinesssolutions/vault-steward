FROM ubuntu:latest
RUN apt update \
    && apt install curl --yes

COPY init-scripts/* /vault-scripts/
RUN chmod 744 /vault-scripts/*

CMD /bin/bash
