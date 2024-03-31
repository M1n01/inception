# Variables
COMPOSE_FILE := srcs/docker-compose.yml
ENV_FILE := srcs/.env

# Targets
all: up

up:
    docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d --build

down:
    docker compose -f $(COMPOSE_FILE) down

start:
    docker compose -f $(COMPOSE_FILE) start

stop:
    docker compose -f $(COMPOSE_FILE) stop

restart: stop start

clean:
    docker compose -f $(COMPOSE_FILE) down -v --rmi all

fclean: clean
    docker system prune -f

re: fclean all

.PHONY: all up down start stop restart clean fclean re
