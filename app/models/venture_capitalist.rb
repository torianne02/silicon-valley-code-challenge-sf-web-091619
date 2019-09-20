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
end