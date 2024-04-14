# README

### Executed with
- docker compose version 2.21.0
### Generate credentials for production
```
rails credentials:edit --environment production
```
### Create a .env
```
# docker-entrypoint
DB_HOST=localhost
DB_USERNAME=rails
DB_NAME_POSTGRES=postgres
# compose
DB_NAME=earthquake_backend_production
DB_HOST_NAME=db
RAILS_ENV=production
DB_PASSWORD=postgres
# COPY the config/credentials/production.key value
RAILS_MASTER_KEY=cc9eed147e62e4d79bff592aa4b8e5xd
# frontend cors
FRONTEND_URL_BASE=http://localhost:5173
```
### Build and Up
```
docker compose build
docker compose up -d
docker compose exec backend bin/rails db:prepare
```
### Optional other Commands
```
docker compose exec backend bin/rails c
docker compose exec backend bin/rails earthquake_data:fetch
docker exec -it earthquake_backend crontab -l
```

### Update scheduler
```
docker compose down
docker compose up -d --build
docker compose exec backend bin/bundle exec whenever --update-crontab
docker exec -it -u0 earthquake_backend service cron restart
docker compose exec backend tail -f -n 100 log/cron.log
```
### Deployed Project CURLs
```
curl --location --request GET 'https://jdebu.work/backend/api/earthquakes?page=1&per_page=2'

curl --location --request GET 'https://jdebu.work/backend/api/earthquakes?page=1&per_page=2&mag_type[]=md'

curl --location --request POST 'https://jdebu.work/backend/api/comments.json' \
--header 'Content-Type: application/json' \
--data-raw '{
    "earthquake_id": "1",
    "body": "Hello",
    "user_id": "2",
    "user_fullname": "Lily"
}'
```