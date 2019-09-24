class Startup
  attr_reader :name, :domain, :founder

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

  def pivot(domain, name)
    @domain = domain
    @name = name
  end  

  def self.find_by_founder(founder) 
    @@all.find(founder)
  end 

  def self.domains
    @@all.collect { |s| s.domain }
  end 

  def sign_contract(venture_capitalist, type, total_invested)
    FundingRound.new(self, venture_capitalist, type, total_invested)
  end

  def num_funding_rounds
    return my_funding_rounds.size
  end

  def total_funds 
    total_funds = 0
    my_funding_rounds.map { |round| total_funds += round.investment }

    return total_funds
  end

  def investors 
    investors = Set.new()
    my_funding_rounds.map { |round| investors << round.venture_capitalist }
    return investors.to_a
  end 

  def big_investors 
    investors.select { |investor| VentureCapitalist.tres_commas_club.include?(investor) }
  end

  # HELPER METHOD
  def my_funding_rounds
    FundingRound.all.select { |round| round.startup == self }
  end 
end
