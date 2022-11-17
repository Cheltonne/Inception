COMPOSE	= cd srcs && docker compose

all:
			sudo mkdir -p /home/chajax/data/mysql 
			sudo mkdir -p /home/chajax/data/html
			$(MAKE) up
up :
	$(COMPOSE) up
down :
	$(COMPOSE) down
up-v :
	$(COMPOSE) --verbose up
up-b :
	$(COMPOSE) up --build
up-d :
	$(COMPOSE) up -d
config :
	$(COMPOSE) config
re : fclean all up

clean :
			$(COMPOSE) down -v --rmi all --remove-orphans

fclean :	clean
			sudo rm -rf	/home/chajax/data/mysql \
						/home/chajax/data/html
			docker system prune --volumes --all --force
			docker network prune --force
			echo docker volume rm $(docker volume ls -q)
			docker image prune --force

.PHONY : all build up up-b up-v up-d config down clean fclean re
