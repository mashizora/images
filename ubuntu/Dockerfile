FROM ubuntu:noble

ENV DEBIAN_FRONTEND=noninteractive
RUN apt-get update && apt-get -y upgrade

RUN apt-get -y install --no-install-recommands \
    ca-certificates \
    software-properties-common \
    build-essential \
    curl wget unzip

ADD scripts/* /imagebuilder/
RUN bash /imagebuilder/install-git.sh
RUN bash /imagebuilder/install-node.sh
RUN bash /imagebuilder/install-p4.sh
RUN bash /imagebuilder/install-python.sh
RUN rm -rf /imagebuilder
