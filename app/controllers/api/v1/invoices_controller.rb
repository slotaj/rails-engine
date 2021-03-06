class Api::V1::InvoicesController < ApplicationController
  respond_to :json, :xml

  def index
    respond_with Invoice.all
  end

  def show
    respond_with Invoice.find_by(id: params[:id])
  end

  def random
    respond_with Invoice.random
  end

  def transactions
    respond_with Invoice.find_by(id: params[:id]).transactions
  end

  def invoice_items
    respond_with Invoice.find_by(id: params[:id]).invoice_items
  end

  def items
    respond_with Invoice.find_by(id: params[:id]).items
  end

  def customer
    respond_with Invoice.find_by(id: params[:id]).customer
  end

  def merchant
    respond_with Invoice.find_by(id: params[:id]).merchant
  end

  def find
    respond_with Invoice.find_by(invoices_params)
  end

  def find_all
    respond_with Invoice.where(invoices_params)
  end

  private

  def invoices_params
    params.permit(:id, :customer_id, :merchant_id, :status, :created_at, :updated_at)
  end

end
