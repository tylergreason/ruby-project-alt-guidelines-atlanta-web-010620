class AddDishAndIngredientToRecipe < ActiveRecord::Migration[5.2]
    def change
      add_column :recipes, :ingredient_id, :integer
      add_column :recipes, :dish_id, :integer
    end
  end