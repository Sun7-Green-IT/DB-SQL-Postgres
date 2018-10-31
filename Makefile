.DEFAULT_GOAL := help
help: 
	@grep -E '(^[a-zA-Z_-]+:.*?##.*$$)|(^##)' $(MAKEFILE_LIST) | awk 'BEGIN {FS = ":.*?## "}; {printf "\033[32m%-30s\033[0m %s\n", $$1, $$2}' | sed -e 's/\[32m##/[33m/'
.PHONY: help 

##
##-----------------------------------------
##             P R O J E C T
##-----------------------------------------
start: ## All-in-one command to start & launch containers
start: pre docker

stop: ## All-in-one command to stop & remove containers 
stop: 
	docker-compose down

.PHONY: start stop

##
##-----------------------------------------
##              D O C K E R
##-----------------------------------------

docker: build launch

build: ## Build containers from images
build:
	docker-compose build

launch: ## Set containers UP
launch:
	docker-compose up -d

.PHONY: build launch


pre: .env docker-compose.yml

docker-compose.yml: docker-compose.yml.dist
	@if [ -f docker-compose.yml ]; \
	then\
		echo 'docker-compose.yml already exists';\
	else\
		echo cp docker-compose.yml.dist docker-compose.yml;\
		cp docker-compose.yml.dist docker-compose.yml;\
	fi

.env: .env.dist
	@if [ -f .env ]; \
	then\
		echo '.env already exists';\
	else\
		echo cp .env.dist .env;\
		cp .env.dist .env;\
	fi
