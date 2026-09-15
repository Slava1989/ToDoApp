include .env
export

export PROJECT_ROOT=$(shell pwd)

env-up:
	docker compose up -d todoapp-postgres

env-down:
	docker compose down todoapp-postgres

env-cleanup:
	@read -p "Clear all volume files? Warning of lossing all your data. [y/N]: " ans; \
	if [ "$$ans" = "y" ]; then \
		docker compose down todoapp-postgres && \
		rm -rf out/pgdata && \
		echo "Files are cleared"; \
	else \
		echo "Clean up was canceled"; \
	fi

migrate-create:
	@if [ -z "$(seq)" ]; then \
		echo "No needed parameter `seq`." && \
		exit 1; \
	fi;

	docker compose run --rm todoapp-postgres-migrate \
		-ext sql \
		-dir /migrations \
		-seq "$(seq)"