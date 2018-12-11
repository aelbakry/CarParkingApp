class ParkingController < ApplicationController

  # Search method that is responsible for obtaining the search parameters
  # from the search bar and redirecting the user to the search results.
  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @parkings = Parking.all.where("lower(location) LIKE :search", search: @parameter)
    end
  end

  # Book method responsible for redirecting the user to new booking page
  # associated to the current parking being viewed
  def book
    @parking = Parking.find(params[:id])
    session[:parking_id] = @parking.id
  end

end
