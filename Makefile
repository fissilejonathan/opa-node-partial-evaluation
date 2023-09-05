
# Variables
DOCKER_COMPOSE_FILE := docker-compose.yaml
IMAGE_LEARNING_HUB := learning-hub
IMAGE_LEARNING_HUB_DB := learning-hub-db

# Default target when running just 'make' without specifying a target
.PHONY: all
all: build-images compose-up

# Build the Docker images
.PHONY: build-images
build-images:
	docker build -t $(IMAGE_LEARNING_HUB) -f learning-hub/Dockerfile learning-hub
	docker build -t $(IMAGE_LEARNING_HUB_DB) -f learning-hub-db/Dockerfile learning-hub-db

# Start the services using docker-compose
.PHONY: compose-up
compose-up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

# Stop and remove containers
.PHONY: compose-down
compose-down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down
