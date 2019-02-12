FROM maven as builder
WORKDIR project
COPY ./SpringMVCSecurityXML .
RUN mvn clean package

FROM tomcat:alpine
COPY --from=builder /project/target/*.war /usr/local/tomcat/webapps/chandu.war
