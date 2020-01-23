class Flavor < ActiveRecord::Base
    has_many :categories
    has_many :dishes, through: :categories

    # class methods 
    def self.flavor_names 
        self.all.map{|flavor| flavor.name}
    end
    # instance methods 

end