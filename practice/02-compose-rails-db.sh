#!/bin/bash
echo "This is just a step by step tutorial, don't run me."
exit

docker-compose run --rm rails bash

# inside docker, update gemfile.lock
bundle lock
exit

# build again
docker-compose build

# test database connection
docker-compose run --rm rails rails g migration test_db
docker-compose run --rm rails rake db:migrate

