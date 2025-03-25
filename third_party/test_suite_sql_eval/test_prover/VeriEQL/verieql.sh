#!/bin/bash

sudo docker-compose build
sudo docker-compose up -d

sudo docker exec -it verieql bash

sudo docker-compose stop
