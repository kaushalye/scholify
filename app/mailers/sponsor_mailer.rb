class SponsorMailer < ApplicationMailer
  default from: "secretary@umaav.org.au"
  layout 'mailer'
  
  def welcome_email2(sponsor)
    @sponsor = sponsor
    @url  = 'http://example.com/login'
    #mail(to: 'indikamee@gmail.com', subject: 'Welcome to My Awesome Site ')
  end
end
