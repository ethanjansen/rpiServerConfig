FROM debian:stable-slim
RUN apt-get update && apt-get install curl wakeonlan ssh -y
RUN mkdir -p /Raspi_Commands && mkdir -p /root/Raspi_Runner/Commands && mkdir -p /opt/raspirunner && mkdir -p /root/.ssh
# Copy id_ed25519 ssh key to raspirunner docker folder for automation use
ADD id_ed25519 /root/.ssh/id_ed25519
RUN chmod 400 /root/.ssh/id_ed25519
RUN echo "Host 192.168.1.38\n\tStrictHostKeyChecking no\n" >> /root/.ssh/config

VOLUME /Raspi_Commands /root/Raspi_Runner/Commands /opt/raspirunner

CMD ["/opt/raspirunner/raspirunner.sh"]
