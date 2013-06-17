# describes and processes one row of a csv file

class Area


  attr_accessor :zipcode, :estimates_population, :city, :state


  def initialize(data_hash)
    @zipcode = data_hash[:zipcode] || 0
    @estimated_population = data_hash[:estimated_population] || 0
    @city = data_hash[:city] || "n/a"
    @state = data_hash[:state] || "n/a"
  end


  def to_s
    "#{@city}, #{@state} #{@zipcode} has #{@estimated_population} people." unless
    @zipcode == 0 || @estimated_population == 0 || @city == "n/a" || @state == "n/a"
  end


end
