class MerchantBulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(merchant_bulk_discount_params[:merchant_id])
    @discounts = @merchant.bulk_discounts
  end

  def show
    @merchant = Merchant.find(merchant_bulk_discount_params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  private

  def merchant_bulk_discount_params
    params.permit(:percentage, :quantity_threshold, :merchant_id)
  end
end
