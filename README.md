# Welcome!

This project is a gaming library, both video and board.
It integrates with boardgamegeeks.com which will require
some extra setup to utilize, but it is optional (see below)

## Pre-requisites:
* Docker/docker-compose
* Postgres

## Steps to run your own personal game library locally:
1. Start the service: `docker compose up -d`
2. Exec into the docker container...: `docker exec -it chairman-bored-api-api-1 bash`
3. ...and setup the databse: `rake db:create` then `rake db:migrate`
4. Connect to the service through your browser: http://localhost:3000
