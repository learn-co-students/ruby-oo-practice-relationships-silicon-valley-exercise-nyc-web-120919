require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

su1 = Startup.new("LOAVES", "Paige Schmidt", "Food services")
su2 = Startup.new("Brooklinen","Someone dooshy", "Home Goods") 
su3 = Startup.new("Facebook","Mark Z", "Social Medias")
su4 = Startup.new("The Happiest Kid Co","Karen Tilly", "Childcare")

vc1 = VentureCapitalist.new("Doochebag", 2000000000)
m= VentureCapitalist.new("Chad", 70000000)


binding.pry
0 #leave this here to ensure binding.pry isn't the last line