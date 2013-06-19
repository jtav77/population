# analyzes an array of Areas


class Analytics


  # areas is an array of Area
  # options is an array of hashes
  attr_accessor :areas, :options


  def initialize(areas)
    @areas = areas
    set_options
  end


  def set_options
    @options = []
    @options << { menu_id: 1, menu_title: 'Areas count', method: :how_many }
    @options << { menu_id: 2, menu_title: 'Smallest Population (non 0)',
      method: :smallest_pop }
    @options << { menu_id: 3, menu_title: 'Largest Population',
      method: :largest_pop }
    @options << { menu_id: 4, menu_title: 'How many zips in California?',
      method: :california_zips }
    @options << { menu_id: 5, menu_title: 'Information for a given zip',
      method: :zip_info }
    @options << { menu_id: 6, menu_title: 'Exit', method: :exit }
  end


 def run(choice)
    opt = @options.select {|hash| hash[:menu_id] == choice }.first
    if opt.nil?
      puts "Invalid choice"
    elsif opt[:method] != :exit
      self.send opt[:method]
      :done
    else
      opt[:method]
    end
  end


# find how many zip codes exist in the record
  def how_many
    puts "There are #{@areas.size} areas."
  end


# finds the zip code with the smallest population
  def smallest_pop
      sorted = @areas.sort do |a,b|
        a.estimated_population <=> b.estimated_population
      end

      smallest = sorted.drop_while { |i| i.estimated_population == 0}.first
      if smallest != nil
        puts "#{smallest.city}, #{smallest.state} has the smallest population: "\
          "#{smallest.estimated_population}."
      else
        puts "Insufficient data available."
      end
  end


# finds the zip code with the largest population
  def largest_pop
      sorted = @areas.sort do |a,b|
        b.estimated_population <=> a.estimated_population
      end

      largest = sorted.first
      if largest != nil
        puts "#{largest.city}, #{largest.state} has the largest population: "\
          "#{largest.estimated_population}."
      else
        puts "Insufficient data available."
      end

  end


# finds the number of zip codes in California, may be inaccurate if Area is not fully initialized
  def california_zips
    num_cal_zips = @areas.count {|item| item.state == "CA"}
    puts "There are #{num_cal_zips} zip code match(es) in California."
  end


# search for zip code
  def zip_info
    print "Enter zip: "
    code = gets.strip.to_i
    codes = @areas.select {|item| item.zipcode.to_i == code}
    if codes.empty?
      puts "Zipcode not found"
    else
      puts ""
      codes.each {|item| puts item}
    end
  end


end
