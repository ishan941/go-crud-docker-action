CONTAINER_NAME=go-docker-app

echo "Stopping old container if exists..."
docker stop $CONTAINER_NAME || true
docker rm $CONTAINER_NAME || true

echo "Building Docker image..."
docker build -t $CONTAINER_NAME:latest .

echo "Running new container..."
docker run -d -p 8080:8080 --name $CONTAINER_NAME $CONTAINER_NAME:latest

echo "Deployment complete!"
