class Startup
  attr_accessor :name, :domain
  attr_reader :founder

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

  def domain=(domain) 
    @domain = domain
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
    FundingRound.new(@name, venture_capitalist, type, total_invested)
  end

  def num_funding_rounds
    arr = FundingRound.all.collect { |round| round.startup == self.name }
    return arr.size
  end

  def total_funds 
    total_funds = 0
    FundingRound.all.collect { |round| total_funds += round.investment if round.startup == self.name }

    if round.startup == self.name
      total_funds += round.investment 
    end 
    
    return total_funds
  end

  def investors 
    investors = Set.new()
    FundingRound.all.collect {|round| investors << round.venture_capitalist if round.startup == self.name }
    return investors.to_a
  end 

  def big_investors 
    investors = self.investors
    triple_comma_club = []
    investors.collect { |investor| triple_comma_club << investor if VentureCapitalist.tres_commas_club.map { |capitalist| capitalist.name }.include?(investor) }
    return triple_comma_club
  end
end

# flatiron = Startup.new("Flatiron", "education", "Avi")
# mark_cuban = VentureCapitalist.new("Mark Cuban", 1300000000)
# mr_wonderful = VentureCapitalist.new("Mr. Wonderful", 13000000000000)
# flatiron.sign_contract("Mark Cuban", "Pre-Seed", 12000)
# flatiron.sign_contract("Mark Cuban", "Seed", 5000)
# flatiron.sign_contract("Mr. Wonderful", "Seed", 70000)
