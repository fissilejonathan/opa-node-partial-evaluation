
# Variables
DOCKER_COMPOSE_FILE := docker-compose.yaml
IMAGE_LEARNING_HUB := learning-hub
IMAGE_LEARNING_HUB_DB := learning-hub-db
IMAGE_OPA := opa

# Default target when running just 'make' without specifying a target
.PHONY: all
all: build-images compose-up

.PHONY: build-images
build-images:
	docker build -t $(IMAGE_LEARNING_HUB) -f $(IMAGE_LEARNING_HUB)/Dockerfile learning-hub
	docker build -t $(IMAGE_LEARNING_HUB_DB) -f $(IMAGE_LEARNING_HUB_DB)/Dockerfile learning-hub-db
	docker build -t $(IMAGE_OPA) -f $(IMAGE_OPA)/Dockerfile opa

.PHONY: compose-up
compose-up:
	docker-compose -f $(DOCKER_COMPOSE_FILE) up

.PHONY: compose-down
compose-down:
	docker-compose -f $(DOCKER_COMPOSE_FILE) down
