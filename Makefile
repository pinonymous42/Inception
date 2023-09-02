DOCKER:=./srcs/docker-compose.yml

WP_DIR:=/home/kohmatsu/data/wordpress
DB_DIR:=/home/kohmatsu/data/mariadb

all: up

up: edit-hosts $(WP_DIR) $(DB_DIR)
	docker-compose -f $(DOCKER) build --no-cache
	docker-compose -f $(DOCKER) up -d

down:
	docker-compose -f $(DOCKER) down
	docker volume rm $(docker volume ls -q)

stop:
	docker-compose -f $(DOCKER) stop

clean:
	-@docker builder prune
	-@docker rmi $(docker images -q)
	-@docker volume rm $(docker volume ls -q)
	-@docker network rm $(docker network ls -q)
	-@sudo rm -rf $(WP_DIR) $(DB_DIR)

re: fclean all

$(WP_DIR):
	sudo mkdir -p $(WP_DIR)

$(DB_DIR):
	sudo mkdir -p $(DB_DIR)

edit-hosts:
	@sudo cat /etc/hosts | grep "kohmatsu.42.fr" || sudo echo "127.0.0.1	kohmatsu.42.fr" >> /etc/hosts

.PHONY: all up down stop clean re edit-host