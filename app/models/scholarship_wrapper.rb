class Scholarship_Wrapper

 def initialize(scholarship)
    @schol =scholarship
    @amount = scholarship.amount
 end
 
 def get_scholarship
   return @schol
 end
 
 def get_amount
   return @amount
 end
 
end