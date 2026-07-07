.PHONY: up down logs restart backend-test backend-lint frontend-lint format

up:
	docker compose up --build

down:
	docker compose down --remove-orphans

logs:
	docker compose logs -f

restart:
	docker compose down && docker compose up --build -d

backend-test:
	cd backend && python -m pytest

backend-lint:
	cd backend && ruff check . && black --check . && mypy app

frontend-lint:
	cd frontend && npm run lint

format:
	cd backend && black . && ruff check --fix .
	cd frontend && npm run format
