class BulkTransactionsController < ApplicationController
  before_action :set_bulk_transaction, only: [:show, :edit, :update, :destroy]

  # GET /bulk_transactions
  # GET /bulk_transactions.json
  def index
    @bulk_transactions = BulkTransaction.all
  end

  # GET /bulk_transactions/1
  # GET /bulk_transactions/1.json
  def show
    
  end

  # GET /bulk_transactions/new
  def new
    @bulk_transaction = BulkTransaction.new
    #@scholarships = Scholarship.eligible_all
    @scholarships = Scholarship.active_at(Date.new(2018,01,01))
  end

  # GET /bulk_transactions/1/edit
  def edit
  end

  # POST /bulk_transactions
  # POST /bulk_transactions.json
  def create
    @bulk_transaction = BulkTransaction.new(bulk_transaction_params)

    respond_to do |format|
      if @bulk_transaction.save
        format.html { redirect_to @bulk_transaction, notice: 'Bulk transaction was successfully created.' }
        format.json { render :show, status: :created, location: @bulk_transaction }
      else
        format.html { render :new }
        format.json { render json: @bulk_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /bulk_transactions/1
  # PATCH/PUT /bulk_transactions/1.json
  def update
    respond_to do |format|
      if @bulk_transaction.update(bulk_transaction_params)
        format.html { redirect_to @bulk_transaction, notice: 'Bulk transaction was successfully updated.' }
        format.json { render :show, status: :ok, location: @bulk_transaction }
      else
        format.html { render :edit }
        format.json { render json: @bulk_transaction.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /bulk_transactions/1
  # DELETE /bulk_transactions/1.json
  def destroy
    @bulk_transaction.destroy
    respond_to do |format|
      format.html { redirect_to bulk_transactions_url, notice: 'Bulk transaction was successfully destroyed.' }
      format.json { head :no_content }
    end
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_bulk_transaction
      @bulk_transaction = BulkTransaction.find(params[:id])
    end

    # Never trust parameters from the scary internet, only allow the white list through.
    def bulk_transaction_params
      params.require(:bulk_transaction).permit(:settled_date, :sender, :amount, :amount_lkr, :rate, :bank_date, :chq_no, :bank_acc, :beneficiary, :notes, :effective_year, :effective_months)
    end
end
