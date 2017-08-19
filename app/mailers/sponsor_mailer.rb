class SponsorMailer < ApplicationMailer
  
  def sendReport(sponsor)
    @sponsor = sponsor
    @url  = 'http://example.com/login'
    mail(to: 'indikamee@gmail.com', subject: 'Welcome to My Awesome Site ')
  end
end
