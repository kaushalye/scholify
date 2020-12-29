json.array!(@bulk_transactions) do |bulk_transaction|
  json.extract! bulk_transaction, :id, :settled_date, :sender, :amount, :amount_lkr, :rate, :bank_date, :chq_no, :bank_acc, :beneficiary, :notes, :effective_year, :effective_months
  json.url bulk_transaction_url(bulk_transaction, format: :json)
end
