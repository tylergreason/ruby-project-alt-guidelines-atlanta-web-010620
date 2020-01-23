class CreateRecipes < ActiveRecord::Migration[5.2]
    #define a change method in which to do the migration
    def change
      create_table :recipes do |r|
        r.string :quantity 
      end
    end
  end