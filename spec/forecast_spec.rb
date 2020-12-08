require 'rails_helper'

describe 'Forecast class' do

  it 'can create a new forecast' do
    forecast = Forecast.new('85029', '77.00', '70', '80')
    expect(forecast).to be_instance_of(Forecast)
    expect(forecast.current_temp).to eq(77.0)
    expect(forecast.low).to eq(70)
    expect(forecast.high).to eq(80)
  end

  it 'can calculate daily average temperature' do
    forecast = Forecast.new('85029', '77.00', '70', '80')
    expect(forecast.average).to eq(75)
  end

  it 'can convert to celsius' do
    forecast = Forecast.new('85029', '77.00', '70', '80').to_celsius
    expect(forecast.current_temp).to eq(25.0)
    expect(forecast.low).to eq(21.11)
    expect(forecast.high).to eq(26.67)
  end

end

