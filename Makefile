all: fclean domain up
domain:
	@echo "Creating domain..."
	@echo "127.0.0.1 wbekkal.42.fr" >> /etc/hosts
up: start
	@docker-compose -f ./srcs/docker-compose.yml up --build
start:
	@echo "Creating data files...";
	@mkdir -p /home/wbekkal/data/mysql;
	@mkdir -p /home/wbekkal/data/html/wordpress;
	@sudo chown -R wbekkal:wbekkal /home/wbekkal/data/mysql; 
	@sudo chown -R wbekkal:wbekkal /home/wbekkal/data/html/wordpress; 
down:
	@echo "Stopping containers...";
	@docker-compose -f ./srcs/docker-compose.yml down
clean: down
	@echo "Removing all containers, volumes and networks...";
	@docker system prune -f
	@docker system prune -af --volumes
delete:
	@echo "Deleting data directories...";
	@rm -rf /home/wbekkal/data
fclean: down clean delete
re: fclean all
