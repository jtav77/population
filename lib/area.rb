# describes and processes one row of a csv file

class Area


  attr_accessor :zipcode, :estimated_population, :city, :state


  def initialize(data_hash)
    @zipcode = data_hash[:zipcode].to_i || 0
    @estimated_population = data_hash[:estimated_population].to_i || 0
    @city = data_hash[:city] || "n/a"
    @state = data_hash[:state] || "n/a"
  end


  def to_s
    zip = sprintf("%05d", @zipcode.to_s)
    "#{@city}, #{@state} #{zip} has #{@estimated_population} people."
  end


end
