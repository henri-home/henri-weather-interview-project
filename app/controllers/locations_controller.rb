class LocationsController < ApplicationController
  def create
    @location = Location.new(zipcode: params[:zipcode])
# debugger
    if @location.save
      render json: {status: :created, id: @location.id}
    else
      render json: @location.errors, status: :unprocessable_entity
    end
  end

  private

  # Only allow a list of trusted parameters through.
  def location_params
    params.require(:location).permit(:zipcode)
  end
end
