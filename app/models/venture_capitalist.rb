class VentureCapitalist
    attr_accessor :name, :total_worth
    @@all = []
    def initialize(name, total_worth)
         @name = name 
        @total_worth = total_worth 
         @@all << self 
    end 
    def self.all
         @@all 
    end 
    def self.tres_commas_club
        @@all.select do |venture_capitalist|
            venture_capitalist.total_worth > 1000000000
        end 
    end 
    def offer_contract(startup,type,investment)
        FundingRound.new(startup,self,type,investment)
    end  #to test, VC1.offer_contract(Start_3,investment6,type1)
    def funding_rounds
        FundingRound.all.select {|fundinground| fundinground.venture_capitalist == self}
    end
    def portfolio 
        funding_rounds.map {|fundinground| fundinground.startup}.uniq
    end
    def biggest_invest # test with VC1.biggest_invest
        funding_rounds.max_by{|fundinground| fundinground.investment}
    end 

    ##everything works except for invested(domain)
     def invested(domain) #find a way to test this
        sum = 0
        array = FundingRound.all.select{|fundinground| fundinground.startup.domain == self}
         array.each do |fundinground|
            sum += fundinground.investment 
         end 
         sum
     end

end