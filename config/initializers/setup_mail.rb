#ActionMailer::Base.delivery_method = :sendmail

#ActionMailer::Base.sendmail_settings = { :address => "smtp.gmail.com",
#     :port => "587", :domain => "gmail.com", :user_name => "indikamee@gmail.com", 
#    :password => "", :authentication => "plain", :enable_starttls_auto => true }

#ActionMailer::Base.sendmail_settings = { :address => "mail.umaav.org.au",
#     :port => "465", :domain => "umaav.org.au", :user_name => "secretary@umaav.org.au", 
#    :password => "umaav123+", :authentication => "plain", :enable_starttls_auto => true }
Rails.application.configure do
  config.action_mailer.delivery_method = :smtp
  config.action_mailer.smtp_settings = {
    address:              'sg2plcpnl0123.prod.sin2.secureserver.net',
    port:                 465,
    domain:               'umaav.org.au',
    user_name:            'secretary@umaav.org.au',
    password:             'umaav123+',
    authentication:       'login',
    enable_starttls_auto: true ,
    ssl: true 
  }
  config.action_mailer.file_settings = { :location => Rails.root.join('/home/indika/Downloads/mail') }
    
end

