class FundingRound
    attr_reader :startup, :vc, :type, :amount

    @@all = []
    def initialize (startup, vc, type, amount)
        @startup = startup
        @vc = vc
        @type = type
        @amount = amount

        @@all << self
    end

    def self.all
        @@all
    end

end
