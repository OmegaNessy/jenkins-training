# Build stage
FROM maven:3.8.8-eclipse-temurin-21-alpine AS build
COPY pom.xml /jenkins-training/
COPY src /jenkins-training/src
RUN mvn -f /jenkins-training/pom.xml clean package

# Run stage
FROM openjdk:21
COPY --from=build /jenkins-training/target/jenkins-training-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]