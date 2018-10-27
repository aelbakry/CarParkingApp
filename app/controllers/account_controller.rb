class AccountController < ApplicationController
  def display
    @myuser = User.find(params[:id])
  end
end
