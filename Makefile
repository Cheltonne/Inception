COMPOSE	= cd srcs && docker compose

all:
			sudo mkdir -p /home/chajax/data/mysql 
			sudo mkdir -p /home/chajax/data/html
up :
	$(COMPOSE) up -d
down :
	$(COMPOSE) down
up-v :
	$(COMPOSE) --verbose up
up-b :
	$(COMPOSE) up --build
config :
	$(COMPOSE) config
re : fclean all up

clean :
			$(COMPOSE) down -v --rmi all --remove-orphans

fclean :	clean
			docker system prune --volumes --all --force
			sudo rm -rf	/home/chajax/data/mysql \
						/home/chajax/data/html
			docker network prune --force
			echo docker volume rm $(docker volume ls -q)
			docker image prune --force

.PHONY : all build up down pause unpause clean fclean re
