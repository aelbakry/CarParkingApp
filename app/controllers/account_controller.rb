class AccountController < ApplicationController

  #method that displays the user's profile
  def display
    @myuser = User.find(params[:id])
  end
end
