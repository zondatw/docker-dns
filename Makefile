DOCKER_COMPOSE_CMD := docker-compose
SERVICE_NAME := dns

all: run

run:
	$(DOCKER_COMPOSE_CMD) up --build

attach:
	$(DOCKER_COMPOSE_CMD) exec $(SERVICE_NAME) /bin/bash

ps:
	$(DOCKER_COMPOSE_CMD) ps

stop:
	$(DOCKER_COMPOSE_CMD) stop

.PHONY: clean

clean: stop clear

clear:
	$(DOCKER_COMPOSE_CMD) down