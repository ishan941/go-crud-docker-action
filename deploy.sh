#!/bin/bash

echo "Stopping old container if exists..."
docker stop go-docker_app || true
docker rm go-docker_app || true
docker rmi go-docker_app:latest || true


echo "Building new Docker image..."
docker build -t go-docker-app:latest .


echo "Running new container..."
docker run -d --name go-docker_app -p 8080:8080 go-docker-app:latest

echo "Deployment complete. Application is running on port 8080."
