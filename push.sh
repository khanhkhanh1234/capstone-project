docker tag capstone-email-service quockhanh107/email-service:latest
docker tag capstone-user-service quockhanh107/user-service:latest
docker tag capstone-frontend-service quockhanh107/frontend-service:latest
docker tag capstone-movie-service quockhanh107/movie-service:latest
docker tag capstone-api-gateway quockhanh107/api-gateway:latest
docker tag capstone-eureka-server quockhanh107/eureka-server:latest
docker push quockhanh107/email-service:latest
docker push quockhanh107/user-service:latest
docker push quockhanh107/frontend-service:latest
docker push quockhanh107/movie-service:latest
docker push quockhanh107/api-gateway:latest
docker push quockhanh107/eureka-server:latest
