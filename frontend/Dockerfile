# Stage 1: Build the React app
FROM node:16 AS build_frontend
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build

FROM nginx:alpine as app_frontend
COPY --from=build_frontend /app/build /usr/share/nginx/html
CMD ["nginx", "-g", "daemon off;"]
