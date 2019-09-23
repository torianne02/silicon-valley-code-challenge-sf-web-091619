require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

# ------------ TEST CODE / VARIABLES ------------

flatiron = Startup.new("Flatiron", "flatironschool.com", "Avi")
general_assembly = Startup.new("General Assembly", "generalassemb.ly", "Adam")
mark_cuban = VentureCapitalist.new("Mark Cuban", 1300000000)
mr_wonderful = VentureCapitalist.new("Mr. Wonderful", 13000000000000)
flatiron.sign_contract("Mark Cuban", "Pre-Seed", 12000)
flatiron.sign_contract("Mark Cuban", "Seed", 5000)
flatiron.sign_contract("Mr. Wonderful", "Seed", 70000)
mark_cuban.offer_contract("General Assembly", "Seed", 35000)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line