class FundingRound
    attr_reader :startup, :venture_capitalist, :investment, :type
    @@all = []
    

    def initialize(startup, venture_capitalist, investment,type = '')
        @startup = startup                      #FundingRound#Startup
        @venture_capitalist = venture_capitalist
      #  @investment = investment.to_f&&!neg #and the number cannot be negative
        self.investment=(investment)
        @type = type
        @@all << self
    end 

    def investment=(investment)
        if investment >= 0
            @investment = investment.to_f
        else 
            @investment = 0 #create base case to catch negatives and convert to 0
        end 
    end 


    def self.all
        @@all 
    end 
end
