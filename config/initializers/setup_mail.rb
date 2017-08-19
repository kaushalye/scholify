ActionMailer::Base.delivery_method = :sendmail

ActionMailer::Base.sendmail_settings = { :address => "smtp.gmail.com",
     :port => "587", :domain => "gmail.com", :user_name => "indikamee@gmail.com", 
    :password => "gmailInd", :authentication => "plain", :enable_starttls_auto => true }