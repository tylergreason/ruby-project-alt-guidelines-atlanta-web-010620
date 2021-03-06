<!-- 
Scope of functionalities 

Sources
-->

# Recipes 
A simple Ruby application for storing recipes. 
## Table of Contents 
[Introduction](#introduction)   
[Technologies](#technologies)   
[Launch](#launch)   
[Example of Use](#example_of_use)   
[Project Status](#project_status)   
[Sources](#sources)




## Introduction 
This simple application was created to demonstrate my knowledge of object oriented programming and database management using Ruby and ActiveRecord. The application is meant to hold recipes entered by the user. The recipes are organized by their name and flavors. Users can view all recipes or search for recipes by recipe flavors. The user is also able to add or delete recipes. 

## Technologies
- [Ruby 2.6](https://www.ruby-lang.org/en/)
- [TTY::Prompt 0.20](https://github.com/piotrmurach/tty-prompt)
- [ActiveRecord 5.2](https://rubyonrails.org/)
- [Pry 0.12.2](https://github.com/pry/pry)

## How It Works 

The run.rb file creates an instance of the Console class (found in console_helper.rb). This instance calls its main_menu method. That method gives the user options such as "View all recipes" or "Delete recipe". These menu options are tied to methods that work the same way as main_menu. Each menu was created using TTY::Prompt for ease of production. 

Dishes, ingredients, and flavors are stored in tables, as well as the associations between them. When the user views a dish, that dish's data is retrieved from the Dish table by name and its qualities are displayed. Similarly, when a user selects a dish to delete, that dish is deleted from the Dish table by name. 

When entering flavors for a dish, the flavors the user enters are formatted by the application to be consistent with the flavors already present in the Flavor table. If the flavor the user is trying to add exists in that table (decided by querying for that flavor's name in the table), the flavor is not added, but a new association is made between the already existing flavor and the dish the user is creating. If that flavor is not in the Flavor table, the flavor is created in the table and an association is made between the new flavor and the dish the user is adding. 

When searching for dishes by flavor, if a flavor in the Flavor table does not have any associated dishes, that flavor is not displayed as an option for the user to search by. 

## Launch
From the main directory, first install all necessary dependencies: 
```ruby 
bundle install 
``` 
Then run the application from the same directory with : 
```ruby 
ruby bin/run.rb
``` 

## Example of Use 
The main menu: 

<img src="images/mainMenu.png" height=150px>

Viewing recipes: 

<img src="images/recipeList.png" height=300px>

Adding a recipe: 

<img src="images/addingDish.png" height=300px>

After saving the dish it is added to the recipe list: 

<img src="images/dishAdded.png" width=300px>


## Project Status 
The project is usable and in working order. Suggestions have been made to spruce up the project with ASCII art and a login page, which I am considering for the future. I am also considering restructuring the interface to make the user experience more pleasant. For instance, I am curious if it would be better for the user to pick a recipe from a list, then be presented the option to edit or delete that recipe. If a login feature were to been implemented, then the user could add a recipe they are viewing to their favorite recipes. This would remove the 'delete recipe' option from the main menu and make the application more usable. 

## Sources 

This application was forked from [this](https://github.com/learn-co-students/ruby-project-alt-guidelines-atlanta-web-010620) project skeleton provided by Flatiron. All Ruby files were written by Tyler Greason except for environment.rb and rakefile.rb. 