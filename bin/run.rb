require_relative '../config/environment'
old_logger = ActiveRecord::Base.logger
ActiveRecord::Base.logger = nil

# seed_data() 
system 'clear'
console = Console.new()
# binding.pry
console.main_menu

ActiveRecord::Base.logger = old_logger