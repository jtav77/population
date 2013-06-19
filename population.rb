# execute routines in this file on the command line
# contains menu system and interprets user's input

require_relative 'lib/setup.rb'
require_relative 'lib/analytics.rb'


class Population


  attr_accessor :analytics


  def initialize
    setup = Setup.new
    @analytics = Analytics.new(setup.areas)
  end


  def menu
    system 'clear'
    puts "Population Menu"
    puts "---------------"
    @analytics.options.each {|hash| puts "#{hash[:menu_id]} : #{hash[:menu_title]}"}
  end


  def run
    action = :print
    self.menu
    while action != :exit do
      puts "Choose an option: "
      option = gets.strip.to_i
      action = @analytics.run(option)
      puts "\n\n"
    end
    puts "Exiting"

  end


end
