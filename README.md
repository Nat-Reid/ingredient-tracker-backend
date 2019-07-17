# README

## Ingredient Tracker API

Ingredient Tracker is a web app that Uses the [Spoonacular API](https://spoonacular.com/api) to track ingredients in your house, plan meals, and prevent food waste by tracking perishable ingredients.

Ingredient tracker can just be used to keep track of ingredients that might be perishable, but it's main function is smart meal planning from a full pantry of ingredients. With the /generate-recipes endpoint the API uses a smart algorithm to find meals that optimally use ingredients that are near expiration as well as staple ingredients that are in a users pantry.

## Tools Used
* All user information is kept password protectedted using [JSON Web Token](https://jwt.io/) authentication for accessing all private user data
* All user passwords are securley using the [BCrypt](https://rubygems.org/gems/bcrypt/versions/3.1.11) encryption ruby gem
* Uses a Postgresql relational database which is dynamicaly seeded from the Spoonacular API with ingredients and recipes
* All responsed are formatted with Active Model Serializers

[Frontend](https://github.com/Nat-Reid/ingredient-tracker-frontend)

