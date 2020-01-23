class Ingredient < ActiveRecord::Base
    has_many :recipes
    has_many :dishes, through: :recipes
end