#!/usr/bin/bash
WHITE='\033[1;37m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

echo -e "${WHITE}Select an action:${NC}
\t(${RED}1${NC})\tStart the dockers with a Joomla CMS (mysql, pma, joomla)
\t(${RED}2${NC})\tStop the dokers with a Joomla CMS (mysql, pma, joomla)
\t(${RED}q${NC})\tExit from script"
echo -en "${WHITE}Enter you choise:${NC} "
read choise
case $choise in
    1)  docker-compose -f joomla-docker-compose.yml up -d
    ;;
    2)  docker-compose -f joomla-docker-compose.yml stop
    ;;
    q)  exit 0
    ;;
    *)  exit 1
    ;;
esac

