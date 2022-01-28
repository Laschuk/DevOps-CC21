FROM jenkins/jenkins

ARG HOST_UID=1000
ARG HOST_GID=998
ARG HELM_URL="https://get.helm.sh/helm-v3.8.0-rc.2-linux-amd64.tar.gz"
ENV KUBECONFIG "/home/jenkins/.kube/config"


USER root

#INSTALLING DOCKER INSIDE JENKINS CONTAINER
RUN apt-get update && \ 
apt-get install ca-certificates curl gnupg lsb-release -y && \
curl -fsSL https://download.docker.com/linux/debian/gpg | gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/debian \
$(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null && \
apt-get update && \
apt-get install docker-ce docker-ce-cli containerd.io -y && \

#INSTALLING DOCKER-COMPOSE
curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose && \
chmod +x /usr/local/bin/docker-compose && \
ln -s /usr/local/bin/docker-compose /usr/bin/docker-compose && \

#CHANGING UID AND GID FOR JENKINS USER AND DOCKER GROUP
usermod -u $HOST_UID jenkins && \
groupmod -g $HOST_GID docker && \
usermod -aG docker jenkins && \

#INSTALLING KUBECTL AND COPY CONFIG
curl -L "https://dl.k8s.io/release/$(curl -L -s https://dl.k8s.io/release/stable.txt)/bin/linux/amd64/kubectl" -o /usr/local/bin/kubectl && \
chmod +x /usr/local/bin/kubectl
COPY config /home/jenkins/.kube/
RUN chown -R jenkins:jenkins /home/jenkins/.kube/

RUN curl $HELM_URL -o helm.tar.gz && tar zxvf helm.tar.gz && mv linux-amd64/helm /usr/local/bin/ && rm -rf linux-amd64/ helm.tar.gz
USER jenkins

