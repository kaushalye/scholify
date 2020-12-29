# Preview all emails at http://localhost:3000/rails/mailers/sponsor_report_mailer
class SponsorReportMailerPreview < ActionMailer::Preview
  def sample_mail_preview
    SponsorReportMailer.send_report(Sponsor.find(15))
  end
end
