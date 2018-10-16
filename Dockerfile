FROM maven
WORKDIR project
COPY ./SpringMVCSecurityXML .
RUN mvn clean package

FROM tomcat:alpine
CMD COPY --from=0 /project/target/*.war /usr/local/tomcat/webapps/chandu.war
