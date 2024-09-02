.PHONY: init

run:
	docker-compose up -d

restart:
	docker-compose down
	docker-compose up -d
	
init:
	sudo ./setup.sh

# Clean up Docker containers and volumes
clean:
	docker-compose down --volumes --remove-orphans
	docker system prune --all --force --volumes
