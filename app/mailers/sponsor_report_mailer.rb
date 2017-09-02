class SponsorReportMailer < ApplicationMailer
  def send_report(sponsor)
    @sponsor = sponsor
    @url  = 'http://example.com/login'
    #attachments['filename.html'] = File.read('/media/indika/DATA/SHARE/Documents/Programming/workspace/ScholDb/out/1_UMAAV.html')
    attachments[@sponsor.full_name+'_Summary.pdf'] = {mime_type: 'application/pdf', content: generate_sponsor_pdf_content(sponsor)}
    attachments['UMAAV Scholarship Program.pdf'] = File.read('app/assets/images/ScholarshipPrgram_Feedback.pdf')
    @sponsor.scholarships.sort_by{|x| x.start_date}.reverse.each do |schol|
      attachments['Scholarhsip_'+schol.student.external_name+'.pdf'] = {mime_type: 'application/pdf', content: generate_student_pdf_content(schol.student)}
    end
    mail(
      #to: @sponsor.email,
      to: 'secretary@umaav.org.au', 
      cc: 'scholarships@umaav.org.au,president@umaav.org.au,secretary@umaav.org.au',
      Bcc: 'nishantha.rajapakshe@gmail.com,randykaru@gmail.com,marasinghe@gmail.com,dassa.dml@gmail.com,kaushalye@gmail.com',
      subject: 'Your UMAAV Scholarship Summary - ' +  @sponsor.title  + ' ' + @sponsor.full_name)
    
    #mail(to: @sponsor.full_name+'.eml', subject: 'Your UMAAV Scholarship Summary - ' +  @sponsor.title  + ' ' + @sponsor.full_name)
  end
  
  private 
  def generate_sponsor_pdf_content (sponsor)
      pdf = SponsorReportPdf.new(sponsor)
      f = Tempfile.new("test_temp")
      pdf.render_file f
      f.flush
      File.read(f)
  end
  

  def generate_student_pdf_content (student)
      pdf = StudentReportPdf.new(student)
      f = Tempfile.new("test_temp")
      pdf.render_file f
      f.flush
      File.read(f)
  end
  
  
end
