FROM openjdk:21-jdk

COPY build/libs/kubernetes-demo-app-1.0.jar app.jar

EXPOSE 8080

ENTRYPOINT ["java","-jar","/app.jar"]