ARG SERVICE_NAME=eureka-server

FROM maven:3.8.1-openjdk-17-slim AS build
WORKDIR /app
COPY . .
RUN cd $SERVICE_NAME && mvn install -DskipTests=true

# docker build --no-cache -f Dockerfile --target app -t eureka-server:latest --build-arg SERVICE_NAME=eureka-server .
FROM openjdk:17 as app
WORKDIR /run
COPY --from=build /app/$SERVICE_NAME/target/eureka-server-1.0-SNAPSHOT.jar /run/eureka-server-1.0-SNAPSHOT.jar
EXPOSE 8761
CMD ["java", "-jar", "eureka-server-1.0-SNAPSHOT.jar"]
