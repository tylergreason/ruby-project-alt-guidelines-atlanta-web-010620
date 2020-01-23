class CreateFlavors < ActiveRecord::Migration[5.2]
    def change
      create_table :flavors do |f|
          f.string :name 
      end
    end
  end