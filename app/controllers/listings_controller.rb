class ListingsController < ApplicationController
  def submit_sponsor
      puts params.inspect
      @sponsor = Sponsor.find(params['donation'][:sponsor_id])
      @scholarships = @sponsor.scholarships
  
      respond_to do |format|
        # format.html { render partial: 'minor_categories_select' }
        format.js
      end
    end
end
