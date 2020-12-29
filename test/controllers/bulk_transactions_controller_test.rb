require 'test_helper'

class BulkTransactionsControllerTest < ActionController::TestCase
  setup do
    @bulk_transaction = bulk_transactions(:one)
  end

  test "should get index" do
    get :index
    assert_response :success
    assert_not_nil assigns(:bulk_transactions)
  end

  test "should get new" do
    get :new
    assert_response :success
  end

  test "should create bulk_transaction" do
    assert_difference('BulkTransaction.count') do
      post :create, bulk_transaction: { amount: @bulk_transaction.amount, amount_lkr: @bulk_transaction.amount_lkr, bank_acc: @bulk_transaction.bank_acc, bank_date: @bulk_transaction.bank_date, beneficiary: @bulk_transaction.beneficiary, chq_no: @bulk_transaction.chq_no, effective_months: @bulk_transaction.effective_months, effective_year: @bulk_transaction.effective_year, notes: @bulk_transaction.notes, rate: @bulk_transaction.rate, sender: @bulk_transaction.sender, settled_date: @bulk_transaction.settled_date }
    end

    assert_redirected_to bulk_transaction_path(assigns(:bulk_transaction))
  end

  test "should show bulk_transaction" do
    get :show, id: @bulk_transaction
    assert_response :success
  end

  test "should get edit" do
    get :edit, id: @bulk_transaction
    assert_response :success
  end

  test "should update bulk_transaction" do
    patch :update, id: @bulk_transaction, bulk_transaction: { amount: @bulk_transaction.amount, amount_lkr: @bulk_transaction.amount_lkr, bank_acc: @bulk_transaction.bank_acc, bank_date: @bulk_transaction.bank_date, beneficiary: @bulk_transaction.beneficiary, chq_no: @bulk_transaction.chq_no, effective_months: @bulk_transaction.effective_months, effective_year: @bulk_transaction.effective_year, notes: @bulk_transaction.notes, rate: @bulk_transaction.rate, sender: @bulk_transaction.sender, settled_date: @bulk_transaction.settled_date }
    assert_redirected_to bulk_transaction_path(assigns(:bulk_transaction))
  end

  test "should destroy bulk_transaction" do
    assert_difference('BulkTransaction.count', -1) do
      delete :destroy, id: @bulk_transaction
    end

    assert_redirected_to bulk_transactions_path
  end
end
