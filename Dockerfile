from maven
workdir project
COPY SpringMVCSecurityXML .
CMD mvn clean package

from tomcat:alpine
COPY --from=0 /project/target/*.war /usr/local/tomcat/webapps
