
class Console
    # class variables 
    # use variable for whether or not to present welcome message when coming back to the main menu 
    @welcome = true 
    # skip given amount of lines 
    def self.skip_lines(num=0) 
        num.times do 
            puts " "
            end
    end 

    # present dishes to select 
    def self.select_dish 
        # select a dish to show details about 
        prompt = TTY::Prompt.new
        dishes = Dish.all.map{|dish|dish.name}
        # add an option to exit to the dishes list 
        dishes << 'go back'
        choice = prompt.select("Choose a dish: ", dishes, cycle: true)
        if choice != 'go back' 
            system 'clear'
            Dish.find_by(name: choice).print_dish
            self.select_dish
        else 
            self.main_menu
        end 
    end

    # select from one or more flavors 
    def self.select_by_flavors 
        prompt = TTY::Prompt.new
        selections = prompt.multi_select("Select flavors. Returns a list of all dishes that include those flavors.", Flavor.flavor_names, cycle: true)
        # if dish's flavors - selections == 0, then that dish should be included! 
        # iterate through all the dishes 
        dishes_to_return = []
        # push that dish to dishes_to_return if that dish's flavors match our selections array 
        Dish.all.select{ |dish| 
            dish_flavor_array = dish.flavors.map{|flavor|flavor.name} 
            if selections - dish_flavor_array == [] && selections != []
                dishes_to_return << dish 
                # binding.pry
            end 
            if selections == []
                system 'clear'
                puts "Please select at least one flavor"
                self.select_by_flavors
            end
        }
        #  print each dish that matches 
        if dishes_to_return.length == 0 
            puts "There are no dishes matching those flavors"
            if prompt.yes?("Would you like to search again?")
                system 'clear'
                self.select_by_flavors
            else
                self.main_menu
            end 
        else 
            puts "These dishes match those flavors: "
            dishes_to_return.map{|dish| dish.print_dish}
            if prompt.yes?("Would you like to search again?")
                system 'clear'
                self.select_by_flavors
            else
                self.main_menu
            end

        end 
        # binding.pry 

    end 

    def self.create_dish 
        system 'clear' 
        puts "Create dish"
        prompt = TTY::Prompt.new
        # make empty hashes for ingredients and flavor lists 
        ingredient_list = {}
        flavors_list = []
        puts "What is your dish's name?"
        dish_name = gets.chomp
        puts "How would you describe your dish?"
        dish_description = gets.chomp
        # add ingredients
        self.add_ingredients(ingredient_list)
        # add flavors 
        self.add_flavors(flavors_list)

        # Cooking instructions 
        puts "How do you make your dish?"
        dish_instructions = gets.chomp 

        # check if the details entered are OK. If so, create the new dish. If not, run the method again. 
        system 'clear'
        # make a new instance of this dish. If the user confirms they want to add it, then save it. 
        new_dish = Dish.create(name: dish_name, description: dish_description, instructions: dish_instructions)
        ingredient_list.each {|ingredient,quantity| 
            new_ingredient = Ingredient.create(name: ingredient)
            new_recipe = Recipe.create(dish: new_dish,ingredient: new_ingredient, quantity: quantity)
        }
        # make flavor associations 
        flavors_list.each {|flavor| 
            # binding.pry 
            new_flavor = Flavor.find_or_create_by(name: flavor.downcase.capitalize)
            new_category = Category.find_or_create_by(dish: new_dish, flavor:new_flavor)
        }
        system 'clear'
        puts "Your dish: " 
        new_dish.print_dish 


        # redo prompts with: is this the dish you'd like to add? y/n/main menu 
        prompt.select("Is this the dish you would like to add", cycle: true) do |selection| 
            selection.choice "Yes!", ->{
                # binding.pry 
                system 'clear' 
                puts "Great! It's been added to the list."
                self.select_dish
            } 
            selection.choice "No, let's try again", ->{
                Dish.last.delete
                self.create_dish
            }
            selection.choice "Main menu", ->{self.main_menu}
        end 

  
    end 

    def self.add_ingredients(ingredients_hash)
        puts "Ingredients: "
        puts "What is in your dish? Add one ingredient name. "
        ingredient_name = gets.chomp 
        puts "How much #{ingredient_name} is in your dish?"
        ingredient_quantity = gets.chomp 
        ingredients_hash[ingredient_name] = ingredient_quantity
        prompt = TTY::Prompt.new
        # after getting the ingredient name and quanitity and adding them to a hash that holds each ingredient and quantity, ask the user if they want to add another ingredient. If they don't (n,no), the method returns the ingredient hash, if any other key is pressed they're prompted to add another ingredient and quantity pair. 
        if prompt.yes?("Would you like to add another ingredient?")
            self.add_ingredients(ingredients_hash) 
        else 
            return ingredients_hash
        end
    end 

    def self.add_flavors(array) 
        prompt = TTY::Prompt.new
        puts "Flavors: "
        puts "How would you describe your dish's flavor? One word entries, please." 
        flavor_name = gets.chomp 
        if flavor_name.include?(" ")
            # system 'clear'
            puts "Sorry, no spaces are allowed."
            self.add_flavors(array)
        else 
            array << flavor_name
            if prompt.yes?("Would you like to add another flavor?")
                self.add_flavors(array)  
            else 
                array 
            end 
        end 
    end     

    def self.delete_dish 
        # select a dish to delete
        prompt = TTY::Prompt.new
        puts "Delete dish"
        dishes = Dish.all.map{|dish|dish.name}
        dishes << "go back"
        choice = prompt.select("Choose a dish to delete: ", dishes, cycle: true)
        if choice != "go back"
            Dish.find_by(name: choice).print_dish
            if prompt.yes?("Delete this dish?")
                system 'clear'
                puts "Ok, #{choice} was deleted."
                Dish.find_by(name: choice).destroy
                self.delete_dish
            else 
                system 'clear'
                puts "Ok, nevermind"
                self.delete_dish
            end
        else 
            self.main_menu 
        end 
    end 

    def self.weclome_message
        prompt = TTY::Prompt.new  
        system 'clear' 
        puts "Welcome to Recipes!"
        self.skip_lines(2)
        puts "This application lets you view a list"
        puts "of recipes, and sort those recipes by"
        puts "flavor. You can even delete recipes"
        puts "from this list or add your own!"
        self.skip_lines(2) 
        puts "This application was written by Tyler"
        puts "Greason for their mod 1 coding challenge"
        puts "for the Flatiron School Software"
        puts "Engineering program. The goal of"
        puts "this program is to show a student's"
        puts "understanding of object oriented"
        puts "programming, and interaction with"
        puts "databases, in this case, Active Record."
        self.skip_lines(1)
        puts "You can reach Tyler at tyler.greason at protonmail.com"
    
        self.skip_lines(1)
        prompt.keypress("Press any key to continue")
        @welcome = false 
        system 'clear'

    end 

    def self.main_menu  
        if @welcome 
            self.weclome_message
        end 
        system 'clear'
        prompt = TTY::Prompt.new 
        puts 'Welcome to Recipes!'
        prompt.select("What would you like to do?", cycle: true) do |selection| 
            selection.choice "View all recipies", ->{self.select_dish} 
            selection.choice "View recipies by category", ->{self.select_by_flavors}
            selection.choice "Add recipe", ->{self.create_dish}
            selection.choice "Delete recipe", ->{self.delete_dish}
            selection.choice "Exit", ->{exit}
        end 
    end 

end 