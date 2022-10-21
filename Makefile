COMPOSE	= cd srcs && docker compose

all:
			 mkdir	srcs/requirements/mariadb/conf \
					srcs/requirements/mariadb/data \
					srcs/requirements/wordpress/html
up :
	$(COMPOSE) up -d
down :
	$(COMPOSE) down
up-v :
	$(COMPOSE) up
up-b :
	$(COMPOSE) up --build

re : fclean all up

clean :
			$(COMPOSE) down -v --rmi all --remove-orphans

fclean :	clean
			docker system prune --volumes --all --force
			sudo rm -rf srcs/requirements/mariadb/conf \
						srcs/requirements/mariadb/data \
						srcs/requirements/wordpress/html
			docker network prune --force
			echo docker volume rm $(docker volume ls -q)
			docker image prune --force

.PHONY : all build up down pause unpause clean fclean re
