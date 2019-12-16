class Startup

  attr_reader :founder, :name, :domain
  @@all = []

  def initialize(name, founder, domain='')
    @name = name
    @founder = founder
    @domain = domain
    @@all << self
  end

  def sign_contract(venture_capitalist, type, investment)
    FundingRound.new(self, venture_capitalist, type, investment)
  end
  # test by s1.sign_contract(v2, "type", 13)

  def funding_round
    FundingRound.all.select {|funding_round| funding_round.startup == self}
  end

  def num_funding_rounds
    self.funding_round.count
  end

  def total_funds
    self.funding_round.sum {|funding_round| funding_round.investment}
  end

  def investors
    self.funding_round.map {|funding_round| funding_round.venture_capitalist}.uniq
  end

  def big_investors
    big_investors = VentureCapitalist.tres_commas_club
    self.investors.select {|investor| big_investors.include?(investor)}.uniq
    # big_investors variable called the class method from VC class
    # self.investors is iterating through each investor(vc obj) and
    # checking to see if big_investors includes the investor and if
    # it does it will select and return an array, if false and
    # doesn't store info in array
  end

  def self.all
    @@all
  end

end
