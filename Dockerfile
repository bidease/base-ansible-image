FROM ubuntu:20.04
RUN apt-get update && DEBIAN_FRONTEND=noninteractive apt-get install -yq --no-install-recommends rsync make openssh-client jq python3 python3-pip python3-distutils libssl-dev libffi-dev build-essential python3-dev libxml2-utils
COPY requirements.txt /root/
RUN pip3 install -r /root/requirements.txt
RUN apt-get remove -y python3-pip libssl-dev libffi-dev build-essential python3-dev && apt-get autoremove -y && apt-get autoclean && rm -fr /var/lib/apt/lists/*
RUN mkdir /opt/ansible && mkdir /root/.ssh && chmod 0700 /root/.ssh
