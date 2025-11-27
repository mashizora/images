FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive
SHELL ["/bin/bash", "--login", "-euo", "pipefail", "-c"]

RUN apt-get update && apt-get -y upgrade
RUN apt-get -y install --no-install-recommends \
    ca-certificates \
    build-essential \
    software-properties-common \
    curl wget unzip xz-utils jq

ADD scripts/* /imagebuilder/
RUN bash /imagebuilder/install-git.sh
RUN bash /imagebuilder/install-node.sh
RUN bash /imagebuilder/install-p4.sh
RUN bash /imagebuilder/install-python.sh
RUN rm -rf /imagebuilder
