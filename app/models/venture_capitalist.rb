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
        @@all.select {|vc| vc.total_worth > 1000000000}
    end

    def offer_contract(startup, investment_type, investment_amt)
        FundingRound.new(startup, self, investment_type, investment_amt)
    end

    def funding_rounds
        FundingRound.all.select {|round| round.venture_capitalist == self}
    end

    def portfolio
        funding_rounds.map {|round| round.startup.domain}.uniq
    end

    def biggest_investment
        biggest_investment = funding_rounds.max {|a, b| a.investment <=> b.investment}
    end

    def invested(domain)
        domain_array = funding_rounds.select {|round| round.startup.domain == domain}
        total_amt_invested = 0
        domain_array.each do |funding_round_with_domain|
            total_amt_invested += funding_round_with_domain.investment
        end
        total_amt_invested
    end

end
