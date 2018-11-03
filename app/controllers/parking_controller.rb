class ParkingController < ApplicationController
  def search
    if params[:search].blank?
      redirect_to(root_path, alert: "Empty field!") and return
    else
      @parameter = params[:search].downcase
      @results = Parking.all.where("lower(location) LIKE :search", search: @parameter)
    end
  end

  def book
    @parking = Parking.find(params[:parkingRef])
  end
end
