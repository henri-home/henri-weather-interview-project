class Forecast

  attr_accessor :low, :high, :current_temp

  def initialize(location, current_temp, low, high)
    @location = location
    @current_temp = current_temp
    @low = low
    @high = high
  end

  def daily_average_temperature
    (@low.to_f + @high.to_f)/2.0
  end

  def in_celsius
    @low = fahrenheit_to_celsius(@low)
    @current_temp = fahrenheit_to_celsius(@current_temp)
    @high = fahrenheit_to_celsius(@high)
    self
  end

  private

  def fahrenheit_to_celsius(fahrenheit)
    ((fahrenheit - 32) * (5.0/9.0))
  end

end
