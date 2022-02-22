FROM jenkins/jenkins:latest-jdk11
USER root
RUN apt-get update && apt-get install -y lsb-release && curl -fsSL https://download.docker.com/linux/debian/gpg | \
gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg && \
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] \
https://download.docker.com/linux/debian $(lsb_release -cs) stable" | tee /etc/apt/sources.list.d/docker.list > /dev/null
RUN apt-get update && apt-get install -y docker-ce-cli && apt-get purge -y distro-info-data libmpdec3 \
libpython3-stdlib libpython3.9-minimal libpython3.9-stdlib lsb-release media-types python3 python3-minimal \
python3.9 python3.9-minimal
#COPY --chown=jenkins:jenkins ./ssl/localhost_ssl_cert.pem /var/lib/jenkins/cert
#COPY --chown=jenkins:jenkins ./ssl/localhost_ssl_private.key /var/lib/jenkins/pk
#ENV JENKINS_OPTS --httpPort=-1 --httpsPort=8083 --httpsCertificate=/var/lib/jenkins/cert --httpsPrivateKey=/var/lib/jenkins/pk
#EXPOSE 8083
COPY --chown=jenkins:jenkins plugins.txt /usr/share/jenkins/ref/plugins.txt
RUN jenkins-plugin-cli -f /usr/share/jenkins/ref/plugins.txt
RUN groupadd -g 998 docker && usermod -aG docker jenkins
USER jenkins
