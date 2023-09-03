DOCKER=./srcs/docker-compose.yml

WP_DIR=/home/kohmatsu/data/wordpress/
DB_DIR=/home/kohmatsu/data/mariadb/

all: up

up: edit-hosts $(WP_DIR) $(DB_DIR)
	docker-compose -f $(DOCKER) build --no-cache
	docker-compose -f $(DOCKER) up -d

down:
	docker-compose -f $(DOCKER) down --volumes --rmi all
	sudo rm -rf $(WP_DIR) $(DB_DIR)

$(WP_DIR):
	sudo mkdir -p $(WP_DIR)

$(DB_DIR):
	sudo mkdir -p $(DB_DIR)

re: down all

edit-hosts:
	@sudo cat /etc/hosts | grep "kohmatsu.42.fr" > /dev/null || sudo echo '127.0.0.1	kohmatsu.42.fr' >> /etc/hosts

.PHONY: all up down re edit-hosts