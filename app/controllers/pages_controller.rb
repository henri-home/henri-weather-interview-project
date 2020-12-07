class PagesController < ApplicationController

  def home
    @locations = Location.all.order(created_at: :asc)
    @location = Location.find(params[:id])
    @forecast = OpenWeatherMap.new.get_forecast_by_location(@location)
  end

end
