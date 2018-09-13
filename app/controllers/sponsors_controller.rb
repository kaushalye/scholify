class SponsorsController < ApplicationController
  before_action :set_sponsor, only: [:show, :edit, :update, :destroy]

  # GET /sponsors
  # GET /sponsors.json
  def index
    @sponsors = Sponsor.all
  end

  # GET /sponsors
  # GET /sponsors.json
  def fye_report
    @sponsors = Sponsor.all
  end
  
  # GET /sponsors/1
  # GET /sponsors/1.json
  def show
    respond_to do |format|
      format.html
      format.pdf do
        #pdf = SponsorReportPdf.new(@sponsor)
        #send_data pdf.render, filename: @sponsor.full_name+'.pdf', type: 'application/pdf'
        SponsorReportMailer.send_report(@sponsor).deliver_later
        redirect_to sponsors_path, notice: 'Email sent to sponsor :'+@sponsor.full_name 
      end
    end
  end

  # GET /sponsors/new
  def new
    @sponsor = Sponsor.new
  end

  # GET /sponsors/1/edit
  def edit
    #@sponsors = Sponsor.all
    #@sponsors.each do |sponsor|
    #  SponsorReportMailer.send_report(sponsor).deliver_later
    #  logger.info "Email sent for user #{sponsor.full_name}"
    #  end
  end

  # POST /sponsors
  # POST /sponsors.json
  def create
    @sponsor = Sponsor.new(sponsor_params)

    respond_to do |format|
      if @sponsor.save
        format.html { redirect_to @sponsor, notice: 'Sponsor was successfully created.' }
        format.json { render :show, status: :created, location: @sponsor }
      else
        format.html { render :new }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sponsors/1
  # PATCH/PUT /sponsors/1.json
  def update
    respond_to do |format|
      if @sponsor.update(sponsor_params)
        format.html { redirect_to @sponsor, notice: 'Sponsor was successfully updated.' }
        format.json { render :show, status: :ok, location: @sponsor }
      else
        format.html { render :edit }
        format.json { render json: @sponsor.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sponsors/1
  # DELETE /sponsors/1.json
  def destroy
    @sponsor.destroy
    respond_to do |format|
      format.html { redirect_to sponsors_url, notice: 'Sponsor was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_sponsor
      @sponsor = Sponsor.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def sponsor_params
      params.require(:sponsor).permit(:title, :first_name, :last_name, :email, :phone)
    end
end
