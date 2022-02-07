FROM jenkins/jenkins:jdk11
USER root
RUN apt update && \
      apt install -y docker.io sudo && \
      rm -rf /var/lib/apt/lists/* && \
      echo "jenkins ALL=NOPASSWD: ALL" >> /etc/sudoers
USER jenkins