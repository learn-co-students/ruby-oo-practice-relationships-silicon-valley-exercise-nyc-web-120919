class VentureCapitalist

  attr_reader :name, :total_worth
  @@all = []

  def initialize(name, total_worth)
    @name = name
    @total_worth = total_worth
    @@all << self
  end
  
  def funding_round
    FundingRound.all.select {|funding_round| funding_round.venture_capitalist == self}
  end

  def offer_contract(startup, type, investment)
    FundingRound.new(startup, self, type, investment)
  end

  def portfolio
    self.funding_round.map {|funding_round| funding_round.startup}.uniq
    # self.funding_round.map(&:startup).uniq
  end

  def biggest_investment
    self.funding_round.max_by {|funding_round| funding_round.investment}
    # self.funding_round.max_by(&:investment)
  end

  def invested(domain_name)
    domain_funding_round = self.funding_round.select {|funding_round| funding_round.startup.domain == domain_name}
    # domain_funding_round.sum {|funding_round| funding_round.investment}
    # can do domain_funding_round.sum(&:investment) on sum
  end

  def self.tres_commas_club
    self.all.select {|venturecapitalist| venturecapitalist.total_worth > 1_000_000_000}
  end

  def self.all
    @@all
  end

end
