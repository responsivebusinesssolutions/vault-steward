FROM ubuntu:latest
RUN apt update \
    && apt install curl --yes

COPY init-scripts/* /vault-scripts/
RUN chmod 744 /vault-scripts/*

COPY ca.crt /usr/local/share/ca-certificates/kubernetes-cluster.crt
RUN update-ca-certificates

CMD /bin/bash
