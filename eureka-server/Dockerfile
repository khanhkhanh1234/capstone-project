FROM maven:3.8.4-openjdk-17 AS build
WORKDIR /app
COPY . .
RUN mvn install -DskipTests=true

FROM openjdk:17
WORKDIR /run
COPY --from=build /app/target/eureka-server-1.0-SNAPSHOT.jar /run/eureka-server-1.0-SNAPSHOT.jar
EXPOSE 8761
CMD ["java", "-jar", "eureka-server-1.0-SNAPSHOT.jar"]
