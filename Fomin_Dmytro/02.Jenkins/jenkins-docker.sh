#!/usr/bin/bash
WHITE='\033[1;37m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${WHITE}Select an action:${NC}
\t(${RED}0${NC})\tBuild the Jenkins dockers
\t(${RED}1${NC})\tStart the dockers with a Jenkins CI/CD (Jenkins, docker-in-docker, ngrok)
\t(${RED}2${NC})\tStop the dokers with a Jenkins CI/CD (Jenkins, docker-in-docker, ngrok)
\t(${RED}q${NC})\tExit from script"
echo -en "${WHITE}Enter you choise:${NC} "
read choise
case $choise in
    0)  docker-compose -f jenkins/jenkins-docker-compose.yml build
    ;;
    1)  docker-compose -f jenkins/jenkins-docker-compose.yml up -d
    ;;
    2)  docker-compose -f jenkins/jenkins-docker-compose.yml stop
    ;;
    q)  exit 0
    ;;
    *)  exit 1
    ;;
esac

