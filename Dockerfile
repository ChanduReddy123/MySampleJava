from maven
CMD git clone https://github.com/ChanduReddy123/MySampleJava.git
workdir MySampleJava/SpringMVCSecurityXML/
run mvn clean package

from tomcat:alpine
copy --from=0  /MySampleJava/SpringMVCSecurityXML/target/SpringMVCSecurityXML.war /usr/local/tomcat/webapps
