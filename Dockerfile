# we will use openjdk 8 with alpine as it is a very small linux distro

FROM maven:3.6.1-jdk-8-alpine AS MAVEN_BUILD

# copy the pom and src code to the container
COPY ./ ./

# package our application code
RUN mvn clean package

# the second stage of our build will use open jdk 8 on alpine 3.9
#FROM openjdk:8-jre-alpine3.9

RUN ls

# copy only the artifacts we need from the first stage and discard the rest
COPY --from=MAVEN_BUILD target/ropu*.jar /demo.jar

# set the startup command to execute the jar
CMD ["java", "-jar", "/demo.jar"]
