require 'rails_helper'

describe 'Location class' do

  it 'prevents saving a blank zipcode' do
    location = Location.new(zipcode:'')
    expect(location).to_not be_valid
  end

  it 'prevents saving a duplicate zipcode' do
    Location.create(zipcode:'12345')
    location = Location.new(zipcode:'12345')
    expect(location).to_not be_valid
  end

  it 'prevents saving a zipcode with a non-numerical character' do
    location = Location.new(zipcode:'abcde')
    expect(location).to_not be_valid
  end

  it 'does not prevent a valid zipcode from being saved' do
    location = Location.new(zipcode:'12345')
    expect(location).to be_valid
  end

end

