from maven
CMD git clone https://github.com/ChanduReddy123/MySampleJava.git
CMD cd MySampleJava/SpringMVCSecurityXML/
CMD mvn clean package

from tomcat:alpine
copy --from=0  /MySampleJava/SpringMVCSecurityXML/target/SpringMVCSecurityXML.war /usr/local/tomcat/webapps
