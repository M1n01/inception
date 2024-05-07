# Variables
COMPOSE_FILE := srcs/docker-compose.yml
ENV_FILE := srcs/.env

WP_VOLUME_DIR := /home/minabe/data/wordpress/logs
DB_VOLUME_DIR := /home/minabe/data/mysql/logs
NGINX_VOLUME_DIR := /home/minabe/data/nginx/logs

# Targets
all: up

up:
	mkdir -p $(WP_VOLUME_DIR) $(DB_VOLUME_DIR) ${NGINX_VOLUME_DIR}
	docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) up -d --build

clean:
	docker compose -f $(COMPOSE_FILE) --env-file $(ENV_FILE) down -v --rmi all --remove-orphans

fclean: clean
	docker system prune -f

re: fclean all

.PHONY: all up clean fclean re