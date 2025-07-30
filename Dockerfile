# Dockerfile for DevSecOps CICD Tic Tac Toe Application

# This is the 1st Stage of the Dockerfile, where we build the application using Node.js.
FROM node:20-alpine AS builder
WORKDIR /app
COPY package*.json ./
RUN npm install
COPY . .
RUN npm run build   

# This is the 2nd Stage of the Dockerfile, where we serve the built application using Nginx.
FROM nginx:alpine
COPY --from=builder /app/dist /usr/share/nginx/html
EXPOSE 80
CMD ["nginx", "-g", "daemon off;"]