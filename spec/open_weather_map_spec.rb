require 'open_weather_map.rb'
require 'httparty'
require 'dotenv/load'

describe 'OpenWeatherMap class' do

  it 'can retrieve weather data and create a new forecast given a zipcode' do
    forecast = OpenWeatherMap.new.get_forecast_by_zipcode(85029)
    expect(forecast).to be_instance_of(Forecast)
    expect(forecast.current_temp).to be_instance_of(Float)
    expect(forecast.low).to be_instance_of(Float)
    expect(forecast.high).to be_instance_of(Float)
  end

end

