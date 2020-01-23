
def seed_data 
    Dish.delete_all
    Ingredient.delete_all
    Recipe.delete_all
    Flavor.delete_all
    Category.delete_all
    
    # dishes 
        indian_curry = Dish.create(name:"Indian Curry", description:"Spicy Indian Dish", instructions:"Pan fry vegetables, combine curry paste with coconut milk, turn stove down to a simmer and combine all ingredients.")
        thai_curry = Dish.create(name:"Thai Curry", description: "A Thai curry", instructions:"Pan fry vegetables, combine curry paste with coconut milk, turn stove down to a simmer and combine all ingredients.")
        tacos = Dish.create(name:"Tacos", description: "A Mexican classic", instructions: "Finely chop all ingredients. Combine as you like in a taco shell, top with cheese.")
        stew = Dish.create(name: "Stew", description: "An easy meal", instructions: "Combine all ingredients in a pot with ample water. Boil, turn down to simmer for one hour, add seasoning, and enjoy!")
        red_beans_and_rice = Dish.create(name:"Red Beans and Rice", description: "A tasty southern American dish", instructions:"Combine all ingredients in one pot and simmer until vegetables are translucent. Add beans and meat, and continue to cook until meat is finished. Add broth, simmer on low for 2 hours. Combine with rice and serve.")
        stir_fry = Dish.create(name: "Stir Fry", description: "An mix of fried veggies", instructions: "Fry vegetables on high heat until translucent, add seasoning, combine with rice, and serve.")
        carrot_cake = Dish.create(name:"Carrot Cake", description: "A sweet cake that's less healthy than it sounds", instructions:"Combine dry and wet ingredients into separate bowls. Mix ingredients. Bake at 300 degrees F for 1 hour. Ice when finished baking.")
        


    # ingredients 
        potato = Ingredient.create(name:"Potato") 
        carrot = Ingredient.create(name:"Carrot")
        onion = Ingredient.create(name:"Onion")
        tomato = Ingredient.create(name:"Tomato")
        curry_paste = Ingredient.create(name:"Curry Paste")
        peas = Ingredient.create(name:"Peas")
        jalepeno = Ingredient.create(name:"Jalepeno")
        flour = Ingredient.create(name:"Flour")
        sugar = Ingredient.create(name:"Sugar")
        salt = Ingredient.create(name: "Salt")
        taco_shells = Ingredient.create(name: "Taco Shell")
        red_beans = Ingredient.create(name:"Red Beans")
        rice = Ingredient.create(name:"Rice")
        green_peppers = Ingredient.create(name: "Green Peppers")
        
        


    # flavors 
        spicy = Flavor.create(name:"Spicy")
        savory = Flavor.create(name:"Savory")
        sweet = Flavor.create(name: "Sweet")
        crunchy = Flavor.create(name:"Crunchy")

    # flavor cards 
    Category.create(dish: indian_curry, flavor: spicy)
    Category.create(dish: thai_curry, flavor: spicy)
    Category.create(dish: tacos, flavor: crunchy)
    Category.create(dish: stew, flavor: savory)
    Category.create(dish: red_beans_and_rice, flavor: savory)
    Category.create(dish: red_beans_and_rice, flavor: spicy)
    Category.create(dish: stir_fry, flavor: spicy)
    Category.create(dish: carrot_cake, flavor: sweet)
    
    

    
    # recipes
        Recipe.create(dish:indian_curry, ingredient: potato, quantity: "2 whole")
        Recipe.create(dish:indian_curry, ingredient: carrot, quantity: "4 whole")
        Recipe.create(dish:indian_curry, ingredient: onion, quantity: "1 whole")
        Recipe.create(dish:indian_curry, ingredient: curry_paste, quantity: "1 2-ounce can")

        Recipe.create(dish:thai_curry, ingredient: potato, quantity: "2 whole")
        Recipe.create(dish:thai_curry, ingredient: carrot, quantity: "4 whole")
        Recipe.create(dish:thai_curry, ingredient: onion, quantity: "1 whole")
        Recipe.create(dish:thai_curry, ingredient: curry_paste, quantity: "1 2-ounce can")

        Recipe.create(dish:tacos, ingredient: tomato, quantity: "1 whole")
        Recipe.create(dish:tacos, ingredient: onion, quantity: "1 whole")
        Recipe.create(dish:tacos, ingredient: jalepeno, quantity: "4 whole")
        Recipe.create(dish:tacos, ingredient: taco_shells, quantity: "10 pack")

        Recipe.create(dish:stew, ingredient: potato, quantity: "2 whole")
        Recipe.create(dish:stew, ingredient: carrot, quantity: "4 whole")
        Recipe.create(dish:stew, ingredient: onion, quantity: "1 whole")
        Recipe.create(dish:stew, ingredient: jalepeno, quantity: "2 whole")

        Recipe.create(dish:red_beans_and_rice, ingredient: red_beans, quantity: "2 cans")
        Recipe.create(dish:red_beans_and_rice, ingredient: rice, quantity: "2 cups")
        Recipe.create(dish:red_beans_and_rice, ingredient: onion, quantity: "1 whole")
        Recipe.create(dish:red_beans_and_rice, ingredient: green_peppers, quantity: "2 whole")

        Recipe.create(dish:stir_fry, ingredient: potato, quantity: "2 whole")
        Recipe.create(dish:stir_fry, ingredient: carrot, quantity: "4 whole")
        Recipe.create(dish:stir_fry, ingredient: onion, quantity: "1 whole")
        Recipe.create(dish:stir_fry, ingredient: green_peppers, quantity: "1 whole")

        Recipe.create(dish:carrot_cake, ingredient: flour, quantity: "2 cups")
        Recipe.create(dish:carrot_cake, ingredient: sugar, quantity: "1/2 cup")
        Recipe.create(dish:carrot_cake, ingredient: salt, quantity: "1 teaspoon")
        Recipe.create(dish:carrot_cake, ingredient: carrot, quantity: "4 whole")


    

    
end