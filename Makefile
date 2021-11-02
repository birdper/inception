
include ./srcs/.env

all:
	mkdir -p $(PATH_WP_DATA)
	mkdir -p $(PATH_DB_DATA)
	docker-compose -f ./srcs/docker-compose.yml up --force-recreate

clean:
	docker-compose -f ./srcs/docker-compose.yml down -v


	#docker stop $(docker ps -qa)
	#docker rm $(docker ps -qa)
	#docker rmi -f $(docker images -qa)
	#docker system prune -a --force

	# docker network rm $$(docker network ls -q)
	# docker volume rm $$(docker volume ls -q)
fclean: clean
	sudo rm -rf $(PATH_DATA)
