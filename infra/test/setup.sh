#!/bin/bash

# Docker setup
docker-compose up -d
sleep 10

# Set up of tables in postgress
sh db_setup/dbcreate.sh