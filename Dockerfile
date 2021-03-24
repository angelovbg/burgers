FROM openjdk:11-jre-slim
VOLUME /burger_api/target

EXPOSE 5060

ARG JAR_FILE=target/*.jar
COPY ${JAR_FILE} app.jar
ENTRYPOINT ["java","-jar","/app.jar"]
