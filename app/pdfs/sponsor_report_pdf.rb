class SponsorReportPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper
  def initialize(sponsor)
    super()
    @sponsor = sponsor
    header
    text_content
    move_down 10
    text "Report date: #{Date.today}"
    #table_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    #image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
    text "#{@sponsor.title} #{@sponsor.first_name} #{@sponsor.last_name}", size: 25, style: :bold
    text "E: #{@sponsor.email}"
    text "T: #{@sponsor.phone}"
    
    move_down 10
    text "Summary :", size: 15, style: :bold
   
    bgcolor= "4EEE61"
    balanceStr="Balance prepaid"
    if (@sponsor.total_donations<@sponsor.total_payments_aud)
      bgcolor= "F55151"
      balanceStr="Balance outstanding"
    end
    data = [
      ["Total payments to your scholarships", "#{number_to_currency(@sponsor.total_payments_lkr, unit: "Rs.", precision: 0)}"],
      ["Total value of payments in AUD","#{number_to_currency(@sponsor.total_payments_aud, precision: 2)}"],
      ["Contributions you've made to-date","#{number_to_currency(@sponsor.total_donations, precision: 2)}" ] ,
      [balanceStr ,{:content=>"#{number_to_currency( (@sponsor.total_donations-@sponsor.total_payments_aud).abs, precision: 2)}", :background_color=>bgcolor}] ]
      
    table(data) do
      columns(1).align = :right
      cells.padding = 5
      column(1).font_style = :bold
    end 
  end

  def text_content
    # Summary of scholarships
    move_down 30
    text "Your Sponsorships:", size: 15, style: :bold
    data =[["Student", "Start date", "End date", "Faculty",  "Status"]] # "Amount (Rs.)",
    @sponsor.scholarships.sort_by{|x| x.start_date}.reverse.each do |schol|
        data += [[ "#{schol.student.external_name}", "#{schol.start_date}" , "#{schol.end_date}",
          "#{schol.student.faculty}",  "#{schol.status}"]] # "#{number_to_currency(schol.amount , unit:"Rs.", precision: 2)}" ,
    end  
    table(data) do
      rows(0).font_style = :bold
      rows(0).background_color = "A9CCE3"
      cells.padding = 5
    end   
    
    @sponsor.scholarships.sort_by{|x| x.start_date}.reverse.each do |schol|
      add_scholarship_details(schol)
    end
    
    
  end

  def add_scholarship_details(schol)
    move_down 30
    text "Summary of sponsorship : #{schol.student.external_name}", size: 15, style: :bold
    nextDonationDue = schol.get_next_donation_due_date
    if (nextDonationDue < Date.today and nextDonationDue < schol.end_date )
      text "Contributions due from : #{nextDonationDue}", size: 15, style: :bold, :color => "ff0000"
   end
   totalAUD=0
   totalLKR=0
   data=[[{:content=>"<b>Scholarship payments made to the student:</b>", :colspan=>3, :background_color => "A9CCE3"}]]
   data+=[["Year","Amount (Rs.)", "Amount (AUD)"]]
   @pp = schol.payments.group(:effective_year).select('effective_year, sum(amount) as lkr, sum(amount_aud) as aud')   
   @pp.sort_by{|x| x.effective_year}.each do |p|
     data += [["#{p.effective_year}",
       "#{number_to_currency(p.lkr, precision: 0, unit: "Rs.")}",
       "#{number_to_currency(p.aud, precision: 2)}",]]
     totalAUD += p.aud
     totalLKR += p.lkr
   end
   data += [["<b>Total</b>", "<b>#{number_to_currency(totalLKR, precision:0, unit: "Rs.")}</b>", "<b>#{number_to_currency(totalAUD, precision: 2)}</b>"]]
   
    data+=[[{:content=>"<b>Your contributions:</b>", :colspan=>3, :background_color => "A9CCE3"}]]
    data+=[["Bank date","Allocated for", "Amount (AUD)"]]
    totalDonations=0
    schol.donations.sort_by{|x| x.bank_date}.each do |donation|
       data += [["#{donation.bank_date}","#{donation.num_of_months} Months from #{donation.valid_from}","#{number_to_currency (donation.amount)}"]]
      totalDonations+=donation.amount
    end      
    data += [[{:content=>"<b>Total</b>", :colspan=>2} , "<b>#{number_to_currency(totalDonations)}</b>"]]
     table(data, :cell_style => { :inline_format => true }) do
      columns(1..2).align = :right
      cells.padding = 5
    end
  end 
  
  
  
  def table_content
    # This makes a call to product_rows and gets back an array of data that will populate the columns and rows of a table
    # I then included some styling to include a header and make its text bold. I made the row background colors alternate between grey and white
    # Then I set the table column widths
    table product_rows do
      row(0).font_style = :bold
      self.header = true
      self.row_colors = ['DDDDDD', 'FFFFFF']
      self.column_widths = [40, 300, 200]
    end
  end

  #def product_rows
  #  [['#', 'Name', 'Price']] +
  #    @products.map do |product|
  #    [product.id, product.name, product.price]
  #  end
  #end
end