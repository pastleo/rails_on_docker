#!/bin/bash

docker-compose run --rm --entrypoint bash rails

# inside docker
bundle lock

