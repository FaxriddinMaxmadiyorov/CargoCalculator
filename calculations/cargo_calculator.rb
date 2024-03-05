module Calculations
class CargoCalculator

  attr_accessor :weight, :length, :width, :height, :dep_point, :dest_point, :distance, :price

  def initialize
    @weight = 0
    @length = 0
    @width = 0
    @height = 0
    @dep_point = ''
    @dest_point = ''
    @distance = 0
    @price = 0
  end

  def input_cargo_params
    puts "Enter weight (kg):"
    @weight = gets.chomp.to_f

    puts "Enter length (cm):"
    @length = gets.chomp.to_f

    puts "Enter width (cm):"
    @width = gets.chomp.to_f

    puts "Enter height (cm):"
    @height = gets.chomp.to_f
  end

  def input_point_params
    puts "Enter departure point:"
    @dep_point = gets.chomp

    puts "Enter destination point:"
    @dest_point = gets.chomp
  end

  def calculate_distance
    @distance = 100
  end

  def calculate_price
    volume = @length * @width * @height / 1000000.0 # converting volume to m^3
    if volume < 1
      price_per_km = 1
    elsif volume >= 1 && @weight <= 10
      price_per_km = 2
    else
      price_per_km = 3
    end

    @price = @distance * price_per_km
  end

  def process
    input_cargo_params
    input_point_params
    calculate_distance
    calculate_price

    { weight: @weight, length: @length, width: @width, height: @height, distance: @distance, price: @price }
  end
end
end

# order = CargoCalculator.new
# result = order.process
# puts result