FROM maven AS builder
WORKDIR /app
COPY . .
RUN mvn clean install

FROM tomcat:jre17 AS runner
WORKDIR /usr/local/tomcat/webapps
COPY --from=builder /app/target/*.war .
EXPOSE 8080


