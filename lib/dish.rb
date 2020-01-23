class Dish < ActiveRecord::Base
    has_many :recipes
    has_many :ingredients, through: :recipes 
    has_many :categories
    has_many :flavors, through: :categories

    # instance methods 
    def print_dish 
        puts "#{name} - #{description}"
        puts "Ingredients:"
        puts recipes.map{|recipe| "- #{recipe.ingredient.name}, #{recipe.quantity}"}
        puts ""
        puts "Preperation instructions:"
        puts instructions
        puts "" 
        puts "#{name} has these flavors:"
        puts flavors.map{|flavor| puts "- #{flavor.name}"}
        puts ""
    end 
end