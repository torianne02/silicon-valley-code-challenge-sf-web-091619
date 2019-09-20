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
end
