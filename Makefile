# Variables
COMPOSE_FILE := srcs/docker-compose.yml
ENV_FILE := srcs/.env

# Targets
all: up

up:
	docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d --build

down:
	docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down -v

clean:
	docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down -v --rmi all --remove-orphans

fclean: clean
	@sudo rm -rf srcs/vendor
	docker system prune -f

re: fclean all

.PHONY: all up down clean fclean re