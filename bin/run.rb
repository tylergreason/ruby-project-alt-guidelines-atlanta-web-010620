require_relative '../config/environment'
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

# seed_data() 
system 'clear'
# Console.select_dish
# Console.create_dish
# Console.delete_dish 
Console.main_menu
# binding.pry



ActiveRecord::Base.logger = old_logger