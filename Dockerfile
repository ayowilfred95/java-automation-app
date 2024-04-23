FROM openjdk:8

WORKDIR /app

COPY target/devops-integration.jar /app/devops-integration.jar

EXPOSE 8080

CMD ["java", "-jar", "devops-integration.jar"]
