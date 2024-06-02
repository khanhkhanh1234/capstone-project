#!/bin/bash

# Create directory structure
mkdir -p /vagrant/capstone-chart/templates/{api-gateway,email-service,eureka-server,frontend,keycloak,mongodb,movie-service,postgres,redis,user-service,zipkin,zookeeper}

# Create YAML files for each service
declare -A services=(
  ["api-gateway"]="api-gateway-deployment.yaml api-gateway-service.yaml"
  ["email-service"]="email-service-deployment.yaml email-service-service.yaml"
  ["eureka-server"]="eureka-server-deployment.yaml eureka-server-service.yaml"
  ["frontend"]="frontend-deployment.yaml frontend-service.yaml"
  ["keycloak"]="keycloak-deployment.yaml keycloak-service.yaml"
  ["mongodb"]="mongodb-deployment.yaml mongodb-pvc.yaml mongodb-pv.yaml mongodb-service.yaml"
  ["movie-service"]="movie-service-deployment.yaml movie-service-service.yaml"
  ["postgres"]="postgres-deployment.yaml postgres-pvc.yaml postgres-pv.yaml postgres-service.yaml"
  ["redis"]="redis-deployment.yaml redis-service.yaml"
  ["user-service"]="user-service-deployment.yaml user-service-service.yaml"
  ["zipkin"]="zipkin-deployment.yaml zipkin-service.yaml"
  ["zookeeper"]="zookeeper-deployment.yaml zookeeper-service.yaml"
)

# Loop through the services array and create the files
for service in "${!services[@]}"; do
  for file in ${services[$service]}; do
    touch /vagrant/capstone-chart/templates/$service/$file
  done
done

echo "All files created successfully."
