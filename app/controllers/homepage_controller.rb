class HomepageController < ApplicationController
  before_action :set_user, only: [ :home]

  def home
  end

  private
  # Method that sets the current user and sets its ID in the session to
  # be used later on in the application
  def set_user
    if user_signed_in?
    session[:user_id] = current_user.id
    @user = User.find(session[:user_id])
    end
  end

end
