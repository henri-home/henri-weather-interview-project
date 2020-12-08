class PagesController < ApplicationController

  def home
    @locations = Location.all.order(created_at: :asc)
  end

end
