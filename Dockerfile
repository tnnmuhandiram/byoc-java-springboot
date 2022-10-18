# Docker multi-stage build

# 1. Building the App with Maven
FROM maven:3.8.6-eclipse-temurin-8-alpine

ADD . /byoc-java-springboot
WORKDIR /byoc-java-springboot

# Just echo so we can see, if everything is there :)
RUN ls -l

# Run Maven build
RUN mvn clean install


# 2. Just using the build artifact and then removing the build-container
# FROM openjdk:18-alpine
FROM eclipse-temurin:18-jdk-alpine

RUN apt install zlib

RUN  apt show zlib   

MAINTAINER tnnmuhandiram

VOLUME /tmp

USER 10014

# Add Spring Boot app.jar to Container
COPY --from=0 "/byoc-java-springboot/target/byoc-*-SNAPSHOT.jar" app.jar

# Fire up our Spring Boot app by default
CMD [ "sh", "-c", "java $JAVA_OPTS -Djava.security.egd=file:/dev/./urandom -jar /app.jar" ]
