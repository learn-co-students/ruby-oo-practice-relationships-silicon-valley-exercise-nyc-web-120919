class VentureCapitalist

    attr_reader :name, :total_worth
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
        self.all.select {|vc| vc.total_worth >= 1000000000}
    end 

    def offer_contract(startup, investment_type, amount_invested)
        FundingRound.new(startup, self, investment_type, amount_invested)
    end 

    def funding_rounds
        FundingRound.all.select do |round|
            round.venture_capitalist == self
        end 
    end 

    def portfolio
        funding_rounds.map {|round| round.startup}
    end 

    def biggest_investment
        funding_rounds.max_by {|round| round.investment_amount}
    end 

    def total_invested 
        total_invested = 0 
        funding_rounds.each do |round|
            total_invested += round.investment_amount
        end 
        total_invested 
    end

    def invested(domain_string)
        #this could be made better by updating the conventions for punctuation/capitalization 
        #   of the domains. Maybe something in the writer for "domain" in the startup class?
        total_investment_by_domain = 0 
        desired_rounds = funding_rounds.select do |round|
            round.startup.domain == domain_string
        end 
        desired_rounds.each do |round|
            total_investment_by_domain += round.investment_amount
        end 
        total_investment_by_domain
    end 

end
