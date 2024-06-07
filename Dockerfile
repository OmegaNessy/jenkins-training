FROM openjdk:21
COPY target/jenkins-training-1.0-SNAPSHOT.jar app.jar
ENTRYPOINT ["java","-jar","app.jar"]