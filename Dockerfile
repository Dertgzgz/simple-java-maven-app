FROM openjdk:8-jdk-alpine
## Para no correr la app como su
#RUN addgroup -S spring && adduser -S spring -G spring
ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
