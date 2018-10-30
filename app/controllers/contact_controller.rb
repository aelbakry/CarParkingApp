class ContactController < ApplicationController
  def show_form
  end

  def request_contact
    name = params[:name]
    email = params[:email]
    telephone = params[:telephone]
    message = params[:message]

    if email.blank?
      flash[:alert] = I18n.t('request_contact.no_email')
    else
      # Send an email
      @user = current_user
      ContactMailer.with(user: @user).contact_email(message).deliver_now
      flash[:notice] = I18n.t('request_contact.email_sent')
    end

    redirect_to root_path
  end
end
