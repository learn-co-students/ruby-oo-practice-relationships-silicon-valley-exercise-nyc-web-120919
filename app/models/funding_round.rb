class FundingRound

    attr_reader :startup, :venture_capitalist, :type, :investment_amount
    @@all = []

    def initialize(startup, venture_capitalist, type, investment_amount)
        @startup = startup
        @venture_capitalist = venture_capitalist
        @type = type
        @investment_amount = investment_amount.to_f
        @@all << self
    end

    def self.all
        @@all
    end 

end
