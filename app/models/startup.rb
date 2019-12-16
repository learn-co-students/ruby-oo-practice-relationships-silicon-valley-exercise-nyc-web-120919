class Startup

    attr_reader :name, :founder, :domain

    @@all = []
    
    def initialize(name, founder, domain)
        @name = name
        @founder = founder
        @domain = domain

        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
        @self
    end

    def self.all
        @@all
    end

    def self.find_by_founder(name)
        @@all.find {|startup| startup.founder == name}
    end

    def sign_contract(vc, investment_type, invested_amt) 
        FundingRound.new(self, vc, investment_type, invested_amt)
    end

    def num_funding_rounds
        FundingRound.all.select {|round| round.startup == self}.length
    end

    def total_funds
        startup_rounds = FundingRound.all.select {|round| round.startup == self}
        investment_array = startup_rounds.map {|round| round.investment}
        investment_array.reduce(0) {|sum,num| sum + num}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end
end
