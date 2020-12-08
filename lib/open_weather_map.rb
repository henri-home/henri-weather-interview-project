class OpenWeatherMap

  def get_forecast_by_zipcode(zipcode)
    response = HTTParty.get("https://api.openweathermap.org/data/2.5/weather?zip=#{zipcode}&appid=#{ENV['OWM_API_KEY']}&units=imperial")
    current_temp = response["main"]["temp"].to_f.round(2)
    low = response["main"]["temp_min"].to_f.round(2)
    high = response["main"]["temp_max"].to_f.round(2)
    Forecast.new(zipcode, current_temp, low, high)
  end

end
