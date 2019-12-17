require_relative '../config/environment.rb'
require_relative '../app/models/startup'
require_relative '../app/models/funding_round'
require_relative '../app/models/venture_capitalist'
def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

VC1 = VentureCapitalist.new("Jack", 123124359112)
VC2 = VentureCapitalist.new("MillionaireGuy", 5313432)
VC3 = VentureCapitalist.new("SomePoorGUy", 1009000)
Start_2 = Startup.new("FACEBOOK", "Mark Z", "Selling your privacy")
Start_1 = Startup.new("AirBNB", "Brian Chesky", "Cheap vacation bro")
Start_3 = Startup.new("eHarmony", "SomeLonelyGuy", "Get laid without commitment")
type1 = 'Series A'
investment1 = 50000
investment6 = 400000
investment2 = 40000
investment3 = -500
investment4 = 94921
#FR1= #PASS IN ARGUMENT #FUNDING ROUND 1 
FR1 = Start_1.sign_contract(VC1,investment1,type1)
FR2 = Start_2.sign_contract(VC2,investment2,type1)
FR3 = Start_1.sign_contract(VC2,investment2,type1)
FR4 = Start_1.sign_contract(VC3,investment3,type1)
FR5 = Start_3.sign_contract(VC3,investment4,type1)
FR6 = Start_3.sign_contract(VC1,investment1,type1)
FR7 = Start_3.sign_contract(VC1,investment6,type1)
FR8 = Start_2.sign_contract(VC1, investment6, type1)
#can use Start_1 or self
domain1 = "Cheap vacation bro"

binding.pry
0 #leave this here to ensure binding.pry isn't the last line