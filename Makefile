.PHONY: init

init:
	sudo ./setup.sh

# Clean up Docker containers and volumes
clean:
	docker-compose down --volumes --remove-orphans
	docker system prune --all --force --volumes
