FROM tomcat:jre17
WORKDIR	/usr/local/tomcat/webapps
COPY target/LoginWebApp.war .
EXPOSE 8080

