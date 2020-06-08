.PHONY: dc-rebuild
dc-rebuild: dc-delete dc-build dc-up  ## delete old system and build new

.PHONY: dc-build
dc-build: ## build environment and initialize composer and project dependencies
		docker-compose build

.PHONY: dc-stop
dc-stop: ## stop environment
		docker-compose stop

.PHONY: dc-delete
dc-delete: ## stop and delete containers, clean volumes.
		docker-compose stop
		docker-compose rm -v -f

.PHONY :dc-up
dc-up: dc-only-up

.PHONY :dc-only-up
dc-only-up: ## up environments, Run containers in the background, print new container names
		docker-compose up -d

.PHONY: dc-release
dc-release: enable-config-prod dc-rebuild dc-comp-inst dc-cc

.PHONY: dc-release-dev
dc-release-dev: enable-config-dev dc-rebuild dc-comp-inst dc-cc

.PHONY: enable-config-dev
enable-config-dev: ## enable all dev configs
		sh oam/runDev.sh

.PHONY: enable-config-prod
enable-config-prod: ## enable all prod configs
		./oam/runProd.sh

.PHONY: dc-comp-inst
dc-comp-inst: ## Update project dependencies
		docker-compose run --rm php sh -lc 'COMPOSER_MEMORY_LIMIT=-1 composer install'

.PHONY: dc-cc
dc-cc: ## clear symfony cache
		docker-compose run --rm php sh -lc 'bin/console cache:clear'