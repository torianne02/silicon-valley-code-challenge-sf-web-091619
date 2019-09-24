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
    tres_commas_club = []
    @@all.collect { |vc| tres_commas_club << vc if vc.total_worth >= 1000000000 }
    return tres_commas_club
  end 

  def offer_contract(startup, type, amount_invested)
    FundingRound.new(startup, self, type, amount_invested)
  end

  def funding_rounds
    my_funding_rounds.size
  end 

  def portfolio 
    startups = Set.new()
    my_funding_rounds.map { |round| startups << round.startup }
    return startups.to_a
  end 

  def biggest_investment 
    my_funding_rounds.max_by { |round| round.investment }
  end 

  def invested(domain)
    my_funding_rounds.sum { |round| round.investment if round.startup.domain == domain }
  end 

  # HELPER METHODS
  def my_funding_rounds
    FundingRound.all.select { |round| round.venture_capitalist == self }
  end
end