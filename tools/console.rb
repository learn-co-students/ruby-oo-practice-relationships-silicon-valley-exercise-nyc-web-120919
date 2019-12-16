require_relative '../config/environment.rb'

def reload
  load 'config/environment.rb'
end
# Insert code here to run before hitting the binding.pry
# This is a convenient place to define variables and/or set up new object instances,
# so they will be available to test and play around with in your console

s1 = Startup.new("cooknow", "eunice")
s2 = Startup.new("juiceme", "deborah", "juiceme.com")
s3 = Startup.new("letshelp", "christine", "letshelp.com")
s4 = Startup.new("eattogether", "eattogether.com")
s5 = Startup.new("noming", "rachael", "noming")
s6 = Startup.new("errrdayeats", "justin", "errrdayeats")
s7 = Startup.new("cookcookaway", "yoonji", "cookcookaway")

v1 = VentureCapitalist.new("sarah", 1600000)
v2 = VentureCapitalist.new("josh", 10009000000)
v3 = VentureCapitalist.new("lisa", 5000000000)
v4 = VentureCapitalist.new("daniel", 9000)
v5 = VentureCapitalist.new("helen", 888999988888)

f1 = FundingRound.new(s1, v1, "series1", 5000000)
f2 = FundingRound.new(s1, v2, "series2", 1343456)
f3 = FundingRound.new(s3, v5, "seriesA", 2323)
f4 = FundingRound.new(s4, v3, "seriesB", 23456)
f5 = FundingRound.new(s5, v3, "series3", 765432345)
f6 = FundingRound.new(s6, v5, "series5", 234562345)
f7 = FundingRound.new(s7, v5, "seriesL", 1212)
f8 = FundingRound.new(s7, v4, "seriesG", 4567)
f9 = FundingRound.new(s7, v5, "seriesZ", 23456)
f10 = FundingRound.new(s2, v5, "seriesZ", 10)
f11 = FundingRound.new(s2, v2, "seriesZ", 10)

binding.pry
0 #leave this here to ensure binding.pry isn't the last line