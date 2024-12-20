FROM debian:stable-slim

RUN apt-get update
RUN apt-get install screen nano procps htop gpg xxd jq moreutils iputils-ping xz-utils rsync groff less curl unzip -y
RUN mkdir -p /root/.local/bin && \
    mkdir -p /root/.aws && \
    mkdir awscli && \
    cd awscli && \
    curl "https://awscli.amazonaws.com/awscli-exe-linux-aarch64.zip" -o "awscliv2.zip" && \
    unzip awscliv2.zip && \
    ./aws/install --bin-dir /root/.local/bin && \
    cd .. && \
    rm -rf awscli
RUN echo 'shell bash' >> /etc/screenrc
RUN mkdir -p /root/.gnupg
RUN mkdir -p /media/root/BACKUP && mkdir -p /media/root/MACBACKUP

VOLUME /root/.aws
# Copy gpg folder to be used for upload encryption -- this is not the safest
VOLUME /root/.gnupg
VOLUME /media/root/BACKUP
VOLUME /media/root/MACBACKUP

WORKDIR /media/root

ENTRYPOINT ["/bin/bash"]
