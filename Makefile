# Makefileの変数定義
COMPOSE_FILE = srcs/docker-compose.yml

# Dockerコンテナをビルドする
build:
	docker-compose -f $(COMPOSE_FILE) build

# Dockerコンテナをバックグラウンドで起動する
up:
	docker-compose -f $(COMPOSE_FILE) up -d

# Dockerコンテナを停止し、コンテナを削除する
down:
	docker-compose -f $(COMPOSE_FILE) down

# Dockerイメージ、停止したコンテナ、ネットワーク、ボリュームを削除する
clean:
	docker-compose -f $(COMPOSE_FILE) down --rmi all --remove-orphans
	docker volume prune -f

# 必要に応じて他のターゲットを追加
