class LocationsController < ApplicationController
  def create
    @location = Location.new(zipcode: params[:zipcode])

    if @location.save
      render json: {status: :created}
    else
      render json: {error: "Zipcode " + @location.errors.messages[:zipcode].first, status: :unprocessable_entity}
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def location_params
    params.require(:location).permit(:zipcode)
  end
end
