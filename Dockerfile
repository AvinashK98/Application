FROM tomcat:jre17
WORKDIR /usr/local/tomcat/webapps/
MAINTAINER AVINASH
COPY /mnt/build/target/LoginApp.war .
EXPOSE 8080
