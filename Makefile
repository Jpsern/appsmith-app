.DEFAULT_GOAL := help

help: ## このヘルプメッセージを出力
	@echo
	@printf "\033[1;4mUSAGE\033[0m\n"
	@printf "  \033[1mmake \033[36m[TARGET] \033[32m([ARGS])\033[0m\n"
	@echo
	@printf "\033[1;4mTARGETS\033[0m\n"
	@grep -E '^[/a-zA-Z0-9_-]+:.*?## .*$$' $(MAKEFILE_LIST) | perl -pe 's%^([/a-zA-Z0-9_-]+):.*?(##)%$$1 $$2%' | awk -F " *?## *?" '{printf "  \033[1;36m%-20s\033[0m %s\n", $$1, $$2}'
.PHONY: help

build: ## コンテナ初期化
	docker-compose build --no-cache
.PHONY: build

up: ## コンテナ起動
	docker-compose up -d
.PHONY: up

down: ## コンテナ停止
	docker-compose down
.PHONY: down

down-all: ## コンテナ掃除
	docker-compose down --rmi all --volumes --remove-orphans
.PHONY: down-all

restart: ## コンテナの再起動
	docker-compose restart 
.PHONY: restart
