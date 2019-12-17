class Startup
    attr_reader :name, :founder, :domain

    @@all = []

    def initialize(name, domain, founder)
        @name = name
        @domain = domain
        @founder = founder

        @@all << self
    end

    def pivot(domain, name)
        @domain = domain
        @name = name
    end

    def sign_contract(vc, investment_type, amount)
        FundingRound.new(self, vc, investment_type, amount)
    end

    def funding_rounds
        FundingRound.all.select{|f_round| f_round.startup == self}
    end

    def num_funding_rounds
        funding_rounds.size
    end

    def total_funds
        funding_rounds.reduce(0){|memo, funding_round| memo += funding_round.amount}
    end

    def investors
        funding_rounds.map{|funding_round| funding_round.vc}.uniq
    end

    def big_investors
        investors.select{|investor| investor.net_worth_tres_commas}
    end

    def self.all
        @@all
    end

    def self.find_by_founder(founders_name)
        @@all.find {|startup| startup.founder == founders_name}
    end

    def self.domains
        @@all.map {|startup| startup.domain}
    end


end
