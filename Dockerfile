FROM openjdk

WORKDIR /usr/src/myapp

COPY /target/spring-recipe-app-0.0.1-SNAPSHOT.jar /app.jar

CMD ["java", "-jar", "/app.jar"]

