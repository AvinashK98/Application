FROM tomcat:jre17
WORKDIR /usr/local/tomcat/webapps/
MAINTAINER AVINASH
COPY /mnt/build/target/LoginWebApp.war .
EXPOSE 8080
