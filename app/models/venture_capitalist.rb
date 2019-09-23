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
    @@all.collect { |v| tres_commas_club << v if v.total_worth >= 1000000000 }
    return tres_commas_club
  end 

  def offer_contract(startup, type, amount_invested)
    FundingRound.new(startup, self.name, type, amount_invested)
  end

  def funding_roungs
    arr = FundingRound.all.collect { |round| round.venture_capitalist == self.name }
    return arr.size
  end 

  def portfolio 
    startups = Set.new()
    FundingRound.all.collect { |round| startups << round.startup if round.venture_capitalist == self.name }
    return startups.to_a
  end 

  def biggest_investment 
    highest = 0
    FundingRound.all.map { |round| 
      if round.venture_capitalist == @name && round.investment > highest
        highest = round.investment
      end
      }
    return highest
  end 

  def invested(domain)
    total_invested = 0
    FundingRound.all.map { |round| 
      if Startup.all.select { |s| s.name == round.startup }[0].domain == domain && round.venture_capitalist == @name
        total_invested += round.investment
      end 
    }
    return total_invested
  end 
end