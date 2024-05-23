#Global variables
ARG SERVICE_NAME_EUREKA_SERVER

#Build step
FROM maven:3.8.1-openjdk-17-slim AS build_eureka_server
ARG SERVICE_NAME_EUREKA_SERVER
WORKDIR /app
COPY ./pom.xml /app
COPY ./$SERVICE_NAME_EUREKA_SERVER /app/$SERVICE_NAME_EUREKA_SERVER
RUN cd /app/$SERVICE_NAME_EUREKA_SERVER && mvn install -DskipTests=true

#Run step
FROM openjdk:17 AS app_eureka_server
WORKDIR /run
ARG SERVICE_NAME_EUREKA_SERVER
COPY --from=build_eureka_server /app/$SERVICE_NAME_EUREKA_SERVER/target/eureka-server-1.0-SNAPSHOT.jar /run/eureka-server-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "/run/eureka-server-1.0-SNAPSHOT.jar"]


#Global variables
ARG SERVICE_NAME_API_GATEWAY

#Build step
FROM maven:3.8.1-openjdk-17-slim AS build_api_gateway
ARG SERVICE_NAME_API_GATEWAY
WORKDIR /app
COPY ./pom.xml /app
COPY ./$SERVICE_NAME_API_GATEWAY /app/$SERVICE_NAME_API_GATEWAY
RUN cd /app/$SERVICE_NAME_API_GATEWAY && mvn install -DskipTests=true

#Run step
FROM openjdk:17 AS app_api_gateway
WORKDIR /run
ARG SERVICE_NAME_API_GATEWAY
COPY --from=build_api_gateway /app/$SERVICE_NAME_API_GATEWAY/target/api-gateway-1.0-SNAPSHOT.jar /run/api-gateway-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "/run/api-gateway-1.0-SNAPSHOT.jar"]

#Global variables
ARG SERVICE_NAME_EMAIL_SERVICE
#Build step
FROM maven:3.8.1-openjdk-17-slim AS build_email_service
ARG SERVICE_NAME_EMAIL_SERVICE
WORKDIR /app
COPY ./pom.xml /app
COPY ./$SERVICE_NAME_EMAIL_SERVICE /app/$SERVICE_NAME_EMAIL_SERVICE
RUN cd /app/$SERVICE_NAME_EMAIL_SERVICE && mvn install -DskipTests=true

#Run step
FROM openjdk:17 AS app_email_service
WORKDIR /run
ARG SERVICE_NAME_EMAIL_SERVICE
COPY --from=build_email_service /app/$SERVICE_NAME_EMAIL_SERVICE/target/email-service-1.0-SNAPSHOT.jar /run/email-service-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "/run/email-service-1.0-SNAPSHOT.jar"]

#Global variables
ARG SERVICE_NAME_MOVIE_SERVICE

#Build step
FROM maven:3.8.1-openjdk-17-slim AS build_movie_service
ARG SERVICE_NAME_MOVIE_SERVICE
WORKDIR /app
COPY ./pom.xml /app
COPY ./$SERVICE_NAME_MOVIE_SERVICE /app/$SERVICE_NAME_MOVIE_SERVICE
RUN cd /app/$SERVICE_NAME_MOVIE_SERVICE && mvn install -DskipTests=true

#Run step
FROM openjdk:17 AS app_movie_service
WORKDIR /run
ARG SERVICE_NAME_MOVIE_SERVICE
COPY --from=build_movie_service /app/$SERVICE_NAME_MOVIE_SERVICE/target/movie-service-1.0-SNAPSHOT.jar /run/movie-service-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "/run/movie-service-1.0-SNAPSHOT.jar"]

#Global variables
ARG SERVICE_NAME_USER_SERVICE

#Build step
FROM maven:3.8.1-openjdk-17-slim AS build_user_service
ARG SERVICE_NAME_USER_SERVICE
WORKDIR /app
COPY ./pom.xml /app
COPY ./$SERVICE_NAME_USER_SERVICE /app/$SERVICE_NAME_USER_SERVICE
RUN cd /app/$SERVICE_NAME_USER_SERVICE && mvn install -DskipTests=true

#Run step
FROM openjdk:17 AS app_user_service
WORKDIR /run
ARG SERVICE_NAME_USER_SERVICE
COPY --from=build_user_service /app/$SERVICE_NAME_USER_SERVICE/target/user-service-1.0-SNAPSHOT.jar /run/user-service-1.0-SNAPSHOT.jar
CMD ["java", "-jar", "/run/user-service-1.0-SNAPSHOT.jar"]