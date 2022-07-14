
all: 	up

up:
		@mkdir -p /home/acollin/data/wp
		@mkdir -p /home/acollin/data/db-data
		@docker-compose -f srcs/docker-compose.yml up --build

down:
		@docker-compose -f srcs/docker-compose.yml down

build:
		@docker-compose -f srcs/docker-compose.yml build

ps:
		@docker-compose -f srcs/docker-compose.yml ps

fclean: down
		@docker rmi -f $$(docker images -qa);\
		docker volume rm $$(docker volume ls -q);\
		docker system prune -a --force
		sudo rm -Rf /home/acollin/data/wp
		sudo rm -Rf /home/acollin/data/db-data
		mkdir /home/acollin/data/wp
		mkdir /home/acollin/data/db-data

re:
		@mkdir -p ../data/wp
		@mkdir -p ../data/db_data
		@docker-compose -f srcs/docker-compose.yml build
		docker-compose -f srcs/docker-compose.yml up

.PHONY: all up down build ps fclean re











