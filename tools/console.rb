require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end

airbnb = Startup.new("AirBnB", "Travel", "Brian Chesky")
lyft = Startup.new("Lyft", "Transportation", "Logan Green")
instagram = Startup.new("Instagram", "Entertainment", "Kevin Systrom")

puts "Test Startup#name"
puts airbnb.name + "\n"

puts "Test Startup#founder"
puts airbnb.founder + "\n"

#airbnb.founder = "testing no change for a founder"

#airbnb.domain = "testing private access to domain"

airbnb.pivot("Hospitality", "Air Hotel")
puts "Test pivot"
puts airbnb.domain + " and name is: " + airbnb.name + "\n"

puts "Test Startup.all"
Startup.all.each {|startup| puts startup}

puts "Test Startup#find_by_founder"
puts Startup.find_by_founder("Logan Green").name + "\n"

puts "Test Startup.domains"
Startup.domains.each {|domain| puts domain}

puts "TEST VentureCapitalist"

richard_branson = VentureCapitalist.new("Richie Branson", 100000)
ray_dalio = VentureCapitalist.new("Ray Dalio", 1500000000000)

puts "Test VC.offer_contract"
ray_invests_in_instagram = ray_dalio.offer_contract(instagram, "Seed A", 40000.00)

puts "Test the name"
puts richard_branson.name

puts "Test the net worth"
puts richard_branson.total_worth

puts "Test all"
VentureCapitalist.all.each {|vc| puts vc}

puts "Test tres commas"
VentureCapitalist.tres_commas_club.each {|vc| puts "#{vc.name} #{vc.total_worth}" }

richie_invests_in_airbnb = airbnb.sign_contract(richard_branson, "Angel", 390000.00)
ray_invests_in_airbnb = airbnb.sign_contract(ray_dalio, "Angel", 450000.00)

puts "Test funding rounds number"
puts airbnb.num_funding_rounds

puts "Test total funds"
puts airbnb.total_funds

puts "Test All Investors for a Startup"
airbnb.investors.each{|investor| puts investor.name}

puts "Test Big Investors for a Startup"
airbnb.big_investors.each{|investor| puts investor.name}

puts "Test funding rounds"
ray_dalio.funding_rounds.each{|f_round| puts f_round.startup.name}

puts "Test portfolio"
ray_dalio.portfolio.each{|startup| puts startup.name}

puts "Test biggest_investment"
puts ray_dalio.biggest_investment.amount

puts "Test invested"
puts richard_branson.invested("Hospitality")



#binding.pry
0 #leave this here to ensure binding.pry isn't the last line