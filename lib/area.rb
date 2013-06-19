# describes and processes one row of a csv file

class Area


  attr_accessor :zipcode, :estimated_population, :city, :state


  def initialize(data_hash)
    @zipcode = data_hash[:zipcode] || 0
    @estimated_population = data_hash[:estimated_population] || 0
    @city = data_hash[:city] || "n/a"
    @state = data_hash[:state] || "n/a"
  end


  def to_s
    "#{@city || 'no-data'}, #{@state || 'no-data'} #{@zipcode || 'no-data'} "
      "has #{@estimated_population || 'no-data'} people."
  end


end
