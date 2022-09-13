FROM openjdk:11
MAINTAINER tharindumu@wso2.com
COPY target/byoc-0.0.1-SNAPSHOT.jar target/byoc-0.0.1-SNAPSHOT.jar
ENTRYPOINT ["java","-jar","target/byoc-0.0.1-SNAPSHOT.jar"]