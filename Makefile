
include ./srcs/.env

all:
	mkdir -p $(PATH_WP_DATA)
	mkdir -p $(PATH_DB_DATA)
	docker-compose -f ./srcs/docker-compose.yml up --force-recreate

clean:
	docker-compose -f ./srcs/docker-compose.yml down


	#docker stop $(docker ps -qa)
	#docker rm $(docker ps -qa)
	#docker rmi -f $(docker images -qa)
	#docker system prune -a --force

fclean: clean
	docker volume rm $(docker volume ls -q)
	docker network rm $(docker network ls -q)
