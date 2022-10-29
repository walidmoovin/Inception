up:
	@docker-compose -f ./srcs/docker-compose.yml up --build
start:
		@if [ ! -d "/home/wbekkal/data/mysql" ]; then
			echo "Creating mysql data directory";
			mkdir -p /home/wbekkal/data/mysql;
		fi
		@if [ ! -d "/home/wbekkal/data/html" ]; then
			echo "Creating html data directory";
			mkdir -p /home/wbekkal/data/html;
		fi

		@sudo chown -R mysql:mysql /home/wbekkal/data/mysql; 
		@sudo chown -R wbekkal:wbekkal /home/wbekkal/data/html; 
down:
	@echo "Stopping containers...";
	@docker-compose -f ./srcs/docker-compose.yml down
clean:
	@echo "Removing all containers...";
	@docker stop $$(docker ps -qa) || true; 
	docker rm $$(docker ps -qa) || true; \
	docker rmi -f $$(docker images -qa) || true; \
	docker volume rm $$(docker volume ls -q) || true; \
	docker network rm $$(docker network ls -q) || true; 
delete:
	@echo "Deleting data directories...";
	@rm -rf /home/wbekkal/data/mysql
	@rm -rf /home/wbekkal/data/html
fclean: down clean delete
re: down clean up
