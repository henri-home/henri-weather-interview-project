require 'app/models/location.rb'

describe 'Location class' do

  it 'prevents saving a blank zipcode' do
    location = Location.new(zipcode:'')
    expect(location).to_not be_valid
  end

  it 'prevents saving a duplicate zipcode' do
    forecast = Forecast.new('85029', '77.00', '70', '80')
    expect(forecast.average).to eq(75)
  end

  it 'prevents saving a zipcode with a non-numerical character' do
    forecast = Forecast.new('85029', '77.00', '70', '80').to_celsius
    expect(forecast.current_temp).to eq(25.0)
    expect(forecast.low).to eq(21.11)
    expect(forecast.high).to eq(26.67)
  end

end

