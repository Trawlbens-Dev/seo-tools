sh:
	docker-compose exec core sh

install:
	docker-compose exec core composer update && php artisan key:generate

log:
	docker-compose logs -f --tail=100

optimize:
	docker-compose exec core php artisan optimize && docker-compose exec core composer dump-autoload && docker-compose exec core php artisan view:cache && docker-compose exec core chown -R www-data:www-data /var/www/storage

build:
	docker-compose build

up:
	docker-compose up -d

down:
	docker-compose down

.PHONY: up
