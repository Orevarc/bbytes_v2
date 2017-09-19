# BBytes

BBytes is an web app that attempts to generate a shopping list based off of recipe URLs. 

## Overview

Recipes input into BBytes have their ingredients run through a Named Entity Recognizer (NER) built upon conditional random fields (CRF). The NER attempts to identify parts of the ingredint passed into distinct entities. For example, the following ingredient will be split up into the following entities:
```
1 cup baby carrots, finely chopped
```
- "1" - QTY
- "cup" - UNIT
- "baby" - COMMENT
- "carrots" - NAME
- ",finely chopped" - COMMENT

Once the ingredient is split, the NAME entities are combined and then checked against a store of base ingredients. If no base ingredient is found, the food entity is then checked against a store of ingredient mappings which map to base ingredients. A store of base ingredients is used to ensure that food items are correctly combined together when combining from different recipes.

## Client

The frontend is built with React / Redux / Webpack and can be found [here](https://github.com/Orevarc/bbytes_client).

## Server

The backend is a REST API built using the Django Rest Framework with a PSQL datastore. Source can be found [here](https://github.com/Orevarc/bbytes_server)

## Install

BBytes uses docker to containerize its development enviroment. For production, I have this project setup to run on two seperate [Heroku](https://www.heroku.com/) dynos. One is a Node.js dyno for running the frontend and the other is a Python dyno for running the API server.

### Running Locally

Run Docker development server

- `$ docker-compose up`

The web app should now be accessible at [http://localhost:3000](http://localhost:3000)

### Stopping 

- `$ docker-compose down`

## Useful Commands

### Listing containers

- `$ docker ps`

### Accessing containers

- `$ docker exec -ti <CONTAINER_NAME> /bin/bash`

### Accessing PSQL

- `$ docker exec -ti <PSQL_CONTAINER_NAME> psql -W bbytes_dev -U bbytes`

**Dev Password is `password`**
