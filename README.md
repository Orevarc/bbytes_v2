# BBytes

BBytes is an web app that attempts to generate a shopping list based off of recipe URLs. It attempts to identy all ingredients and parts of the ingredient (ie. name, unit, amount, etc.) using a Named Entity Recognizer (NER) in order to merge all ingredients over multiple recipes into one concise shopping list. 

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

## Usage

In order to convert choosen recipes into a combined shopping list, the recipe URLs must be entered on the main page of BBytes, each seperated by a new line.

![Screenshot](/bbytes_client/images/recipe_enter.png?raw=true "Entering Recipes")

Once 'Get Ingredients' is pushed, the app will attempt to identify all ingredients and seperate them into named entities where it will then merge them into a shopping list for you. The shopping list page is split into 3 sections: Recipes, Shopping List, & For Review items.

![Screenshot](/bbytes_client/images/shopping_list_example.png?raw=true "Shopping List with For Review")

### Recipes

Shows a list of recipes entered as well options to change the desrired serving size of the recipe.

### Shopping List

This section shows the merged list of ingredients along with the quantity needed to satisfy the recipes shown in the Recipes section. 

### For Review

This section lists the ingredients which the app was not able to parse correctly and asks the user for help identifying what the actual ingredient is. Each item in this list displays the full ingredient line from the recipe along with it's best guess of what the ingredient name actually is. The user can select each item where they will be presented with a dropdown that allows them to select from specify what that ingredient actually is. The app will remember the ingredient entered here for next time so this process does not have to be repeated.

![Screenshot](/bbytes_client/images/shopping_list_only.png?raw=true "Shopping List without For Review")


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
