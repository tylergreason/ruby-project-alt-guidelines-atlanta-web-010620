class Category < ActiveRecord::Base
    belongs_to :dish
    belongs_to :flavor
end