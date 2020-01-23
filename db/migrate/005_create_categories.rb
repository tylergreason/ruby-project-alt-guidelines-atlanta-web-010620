class CreateCategories < ActiveRecord::Migration[5.2]
    def change 
        create_table :categories do |c| 
            c.integer :dish_id 
            c.integer :flavor_id 
        end
    end
  end