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

    def net_worth_tres_commas
        @total_worth > 1000000000
    end

    def offer_contract(startup, investment_type, amount)
        FundingRound.new(startup, self, investment_type, amount)
    end

    def funding_rounds
        FundingRound.all.select{|f_round| f_round.vc == self}
    end

    def portfolio
        funding_rounds.map {|f_round| f_round.startup}.uniq
    end

    def biggest_investment
        funding_rounds.reduce(funding_rounds[0]) do |memo, funding_round| 
                if funding_round.amount > memo.amount
                    memo = funding_round
                end
                memo
            end
    end

    def invested(domain)
        funding_rounds.reduce(0) do |memo, funding_round| 
            if funding_round.startup.domain == domain
                memo += funding_round.amount
            end
            memo
        end

    end

    def self.tres_commas_club
        @@all.select {|vc| vc.net_worth_tres_commas}
    end

end
