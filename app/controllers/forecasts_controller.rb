class ForecastsController < ApplicationController

  def get_forecast
    # params: zipcode: string, celsius: "0" or "1"
    # returns: Forecast object or error message
    begin

      if params[:zipcode].blank?
        raise "Zipcode can't be blank"
      elsif /[^0-9]/.match(params[:zipcode])
        raise 'Zipcode can only contain digits 0-9'
      end

      forecast = OpenWeatherMap.new.get_forecast_by_zipcode(params[:zipcode])

      forecast = forecast.to_celsius if params[:celsius] == '1'

      render json: {status: :ok, forecast: forecast}
    rescue StandardError => e
      render json: {error: e.message, status: :unprocessable_entity}
    end
  end

end
