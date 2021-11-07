
include ./srcs/.env

all: create
	docker-compose -f ./srcs/docker-compose.yml up --force-recreate

re: fclean create
	docker-compose -f ./srcs/docker-compose.yml up --build 

create:
	@mkdir -p $(PATH_WP_DATA)
	@mkdir -p $(PATH_DB_DATA)


init:
	sudo chown nbirdper:docker /var/run/docker.sock


before:
	./srcs/requirements/clean_all.sh

	#docker stop $(docker ps -qa)
	#docker rm $(docker ps -qa)
	#docker rmi -f $(docker images -qa)
	#docker system prune -a --force

	# docker network rm $$(docker network ls -q)
	# docker volume rm $$(docker volume ls -q)



down:
	docker-compose -f ./srcs/docker-compose.yml down -v

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v

fclean: clean
	sudo rm -rf $(PATH_DATA)

allclean:
	./srcs/requirements/clean_all.sh

