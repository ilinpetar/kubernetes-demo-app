# temp container to build using gradle
FROM gradle:8.10.2-jdk-alpine AS GRADLE_BUILD_IMAGE
COPY . .
RUN gradle build

FROM openjdk:21-jdk
COPY --from=GRADLE_BUILD_IMAGE build/libs/kubernetes-demo-app-1.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]