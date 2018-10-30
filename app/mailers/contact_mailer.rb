class ContactMailer < ApplicationMailer


  def contact_email(message)
    @user = params[:user]
    @message = message
    mail(to: @user.email, subject: 'Contact request submitted!')
  end

end
