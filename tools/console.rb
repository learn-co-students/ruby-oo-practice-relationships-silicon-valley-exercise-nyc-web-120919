require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

startup1 = Startup.new("Walmart", "Retail", "Samuel Walton")
startup2 = Startup.new("LearnCo", "Education", "Mr. Bean")
startup3 = Startup.new("McDonalds", "Restaurant", "Ronald")
startup4 = Startup.new("Target", "Retail", "That Dog With the Red Eye Thing")
startup5 = Startup.new("Standard Oil", "Energy", "Samuel Rockefeller")

vc1 = VentureCapitalist.new("Warren", 50000000000)
vc2 = VentureCapitalist.new("Bill", 800000000200)
vc3 = VentureCapitalist.new("Steve", 5000000)
vc4 = VentureCapitalist.new("Kevin", 320000000)
vc5 = VentureCapitalist.new("Darren", 390000)
vc6 = VentureCapitalist.new("Samantha", 4300000)

fr1 = FundingRound.new(startup1, vc1, "Angel", 2200000)
fr2 = FundingRound.new(startup1, vc2, "Seed", 5000004)
fr3 = FundingRound.new(startup1, vc3, "Series A", 11000000)
fr4 = FundingRound.new(startup2, vc1, "Series A", 4400)
fr5 = FundingRound.new(startup2, vc5, "Pre-Seed", 300000)
fr6 = FundingRound.new(startup3, vc2, "Series C", 10)
fr7 = FundingRound.new(startup4, vc4, "Series B", 9000000000)
fr8 = FundingRound.new(startup1, vc6, "Seed", 6200000)




binding.pry
0 #leave this here to ensure binding.pry isn't the last line