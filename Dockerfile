# temp container to build using gradle
FROM openjdk:21-jdk AS GRADLE_BUILD_IMAGE
COPY . .
RUN ./gradlew build

FROM openjdk:21-jdk
COPY --from=GRADLE_BUILD_IMAGE build/libs/kubernetes-demo-app-1.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]