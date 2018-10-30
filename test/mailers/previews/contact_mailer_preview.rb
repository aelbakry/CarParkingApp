# Preview all emails at http://localhost:3000/rails/mailers/contact_mailer
class ContactMailerPreview < ActionMailer::Preview


  def contact_email
    ContactMailer.with(user: User.find(7)).contact_email
  end

end
