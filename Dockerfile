FROM maven:3.8.1-openjdk-17-slim AS eureka-server-build
WORKDIR /app
COPY . .
RUN cd eureka-server && mvn install -DskipTests=true

# docker build --no-cache -f Dockerfile --target eureka-server -t eureka-server:latest .
FROM openjdk:17 as eureka-server
WORKDIR /run
COPY --from=eureka-server-build /app/eureka-server/target/eureka-server-1.0-SNAPSHOT.jar /run/eureka-server-1.0-SNAPSHOT.jar
EXPOSE 8761
CMD ["java", "-jar", "eureka-server-1.0-SNAPSHOT.jar"]
