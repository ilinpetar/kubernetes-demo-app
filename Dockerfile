# temp container to build using gradle
FROM openjdk:21-jdk AS gradle_build_image
RUN microdnf install findutils
COPY . .
COPY .gradle .gradle
RUN ./gradlew bootJar

FROM openjdk:21-jdk
COPY --from=gradle_build_image build/libs/kubernetes-demo-app-1.0.jar app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app.jar"]