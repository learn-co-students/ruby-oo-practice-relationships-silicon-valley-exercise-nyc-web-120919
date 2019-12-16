class Startup

    attr_reader :founder
    attr_accessor :name, :domain
    @@all = []

    def initialize(name, domain, founder)
        @name = name
        @domain = domain
        @founder = founder 
        @@all << self 
    end 

    def self.all
        @@all
    end 

    def pivot(new_name, new_domain)
        self.name = new_name
        self.domain = new_domain
    end 

    def self.find_by_founder(person)
        self.all.find {|startup| startup.founder == person}
    end 

    def self.domains    
        self.all.map {|startup| startup.domain}
        #doesnt return unique values. Could be updated later if needed.
    end 

    def sign_contract(venture_capitalist, investment_type, amount_invested)
        FundingRound.new(self, venture_capitalist, investment_type, amount_invested)
    end 

    def startups_funding_rounds
        FundingRound.all.select do |fundround| 
            fundround.startup == self
        end 
    end 

    def num_funding_rounds
        startups_funding_rounds.length 
    end 

    def total_funds
        total_funds = 0 
        startups_funding_rounds.each do |round|
            total_funds += round.investment_amount
        end 
        total_funds
    end
     
    def investors
        startups_funding_rounds.map do |round|
            round.venture_capitalist
        end 
    end 

    def big_investors
        #investors.select {|investor| investor.total_worth >= 1000000000} 
        investors.select {|investor| VentureCapitalist.tres_commas_club.include?(investor)}
    end 

end
