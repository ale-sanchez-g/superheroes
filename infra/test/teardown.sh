#!/bin/bash

# Clean up the infrastrucuter
docker-compose down
docker volume rm $(docker volume ls -q)