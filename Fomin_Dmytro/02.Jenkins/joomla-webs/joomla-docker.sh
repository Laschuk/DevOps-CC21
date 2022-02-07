#!/usr/bin/bash
WHITE='\033[1;37m'
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m'

if [ -z $1 ] 
then
    echo -e "${WHITE}Select an action:${NC}
    \t(${RED}1${NC})\tStart the dockers with a Joomla CMS (mysql, pma, joomla)
    \t(${RED}2${NC})\tStop the dokers with a Joomla CMS (mysql, pma, joomla)
    \t(${RED}q${NC})\tExit from script"
    echo -en "${WHITE}Enter you choise:${NC} "
    read choise
else
    choise=$1
fi

case $choise in
    1)  docker run -tid --rm --name mysql-db -h mysql-db -p 3306:3306 --net mysql-net -v  webs-mysql-db:/var/lib/mysql \
        -e MYSQL_DATABASE=joomla-db --env-file=.env/mysql.env mysql:5.7.36

        docker run -tid --rm --name pma -h pma -p 85:80 --net mysql-net --env-file=.env/pma.env -e PMA_HOST=mysql-db \
        phpmyadmin:5.1.1-apache

        docker run -tid --rm --name joomla -h joomla -p 80:80 --net mysql-net -v webs-joomla-scode:/var/www/html \
        -e JOOMLA_DB_HOST=mysql-db --env-file=.env/joomla.env joomla:4.0.5-apache
    ;;
    2)  docker stop joomla pma mysql-db || true
    ;;
    q)  exit 0
    ;;
    *)  exit 1
    ;;
esac
