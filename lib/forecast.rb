class Forecast

  attr_accessor :zipcode, :low, :high, :current_temp, :average

  def initialize(zipcode, current_temp, low, high)
    @zipcode = zipcode
    @current_temp = current_temp.to_f
    @low = low.to_f
    @high = high.to_f
    @average = self.daily_average_temperature
  end

  def daily_average_temperature
    ((@low.to_f + @high.to_f)/2.0).round(2)
  end

  def to_celsius
    @low = fahrenheit_to_celsius(@low)
    @current_temp = fahrenheit_to_celsius(@current_temp)
    @high = fahrenheit_to_celsius(@high)
    @average = fahrenheit_to_celsius(@average)
    self
  end

  private

  def fahrenheit_to_celsius(fahrenheit)
    ((fahrenheit - 32) * (5.0/9.0)).round(2)
  end

end
