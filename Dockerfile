# we will use openjdk 8 with alpine as it is a very small linux distro
FROM maven:3.5.2-jdk-8-alpine

RUN mvn --version

COPY src /tmp/src
WORKDIR /tmp/src

RUN echo "PWD is: $PWD"

RUN mvn clean install
 
# copy the packaged jar file into our docker image
COPY target/ropu-*.jar /demo.jar
 
# set the startup command to execute the jar
CMD ["java", "-jar", "/demo.jar"]
