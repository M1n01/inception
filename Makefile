DOCKER_COMPOSE = docker compose

all: build up

build:
	$(DOCKER_COMPOSE) build

up:
	$(DOCKER_COMPOSE) up -d

down:
	$(DOCKER_COMPOSE) down

clean:
	$(DOCKER_COMPOSE) down --rmi all --volumes

fclean: clean
	docker system prune -a --force --volumes

re: fclean all

.PHONY: all build up down clean fclean re
