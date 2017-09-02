class StudentReportPdf < Prawn::Document
  include ActionView::Helpers::NumberHelper
  def initialize(student)
    super()
    @student = student
    header
    text_content
    move_down 10
    text "Report date: #{Date.today}"
    #table_content
  end

  def header
    #This inserts an image in the pdf file and sets the size of the image
    #image "#{Rails.root}/app/assets/images/header.png", width: 530, height: 150
    text "#{@student.full_name}", size: 25, style: :bold
    text "Email: #{@student.email}"
    text "Faculty: #{@student.faculty}"
    text "Department: #{@student.department}"
    
   end

  def text_content
    # Summary of scholarships
    move_down 30
    text "Scholarships:", size: 15, style: :bold
    data =[["Sponsor", "Start date", "End date", "Amount",  "Status"]] # "Amount (Rs.)",
    @student.scholarships.sort_by{|x| x.start_date}.each do |schol|
        data += [[ "#{schol.sponsor.full_name}", "#{schol.start_date}" , "#{schol.end_date}",
          "#{number_to_currency(schol.amount , unit:"Rs.", precision: 0)}", "#{schol.status}"]] # " ,
    end  
    table(data) do
      rows(0).font_style = :bold
      rows(0).background_color = "A9CCE3"
      cells.padding = 5
    end   
    
    @student.scholarships.sort_by{|x| x.start_date}.reverse.each do |schol|
      add_scholarship_details(schol)
    end
    
    
  end

  def add_scholarship_details(schol)
    move_down 30
    totalAUD=0
    totalLKR=0
    data=[[{:content=>"<b>Payments made to student on behalf of: #{schol.sponsor.full_name}</b>", :colspan=>5, :background_color => "A9CCE3"}]]
    data+=[["Payment Id","Bank Date","Scholarship Allocation", "Amount (Rs.)", "Amount (AUD)"]]
    schol.payments.sort_by{|x| [x.bank_date, x.effective_year]}.each do |p|
      data += [["#{p.id}", "#{p.bank_date}","#{p.effective_year}-#{p.effective_month}",
        "#{number_to_currency(p.amount, precision: 0, unit: "Rs.")}",
        "#{number_to_currency(p.amount_aud, precision: 2)}",
        ]]
      totalAUD += p.amount_aud
      totalLKR += p.amount
    end
    data+=[[{:content=>"<b>Total</b>", :colspan=>3, :background_color => "A9CCE3"}, "<b>#{number_to_currency(totalLKR, precision: 0, unit: "Rs.")}</b>","<b>#{number_to_currency(totalAUD, precision: 2)}</b>"]]
    table(data, :cell_style => { :inline_format => true }) do
      rows(0).font_style = :bold
      columns(3).align = :right
      columns(4).align = :right
      rows(0).background_color = "A9CCE3"
      cells.padding = 5
    end
  end
end