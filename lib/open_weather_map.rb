class OpenWeatherMap

  def get_forecast_by_location(location)
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?zip=#{location.zipcode}&appid=#{ENV['OWM_API_KEY']}&units=imperial")
    current_temp = response["main"]["temp"]
    low = response["main"]["temp_min"]
    high = response["main"]["temp_max"]
    Forecast.new(location, current_temp, low, high)
  end

end
