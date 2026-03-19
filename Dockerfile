FROM tomcat:jre17
WORKDIR /usr/local/tomcat/webapps/
MAINTAINER AVINASH
COPY target/LoginWebApp.war .
EXPOSE 8080
