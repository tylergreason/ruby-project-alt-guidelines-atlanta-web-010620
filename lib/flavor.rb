class Flavor < ActiveRecord::Base
    has_many :categories
    has_many :dishes, through: :categories
    
    # class methods 
    # only flavor names with dishes
    def self.active_flavor_names
        self.all.select{|flavor| flavor.dishes !=[]}.map{|flavor| flavor.name}
    end

    # all flavor names 
    def self.flavor_names 
        self.all.map{|flavor| flavor.name}
    end

end