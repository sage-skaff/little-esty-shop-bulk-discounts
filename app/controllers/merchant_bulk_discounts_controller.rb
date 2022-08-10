class MerchantBulkDiscountsController < ApplicationController
  def index
    @merchant = Merchant.find(merchant_bulk_discount_params[:merchant_id])
    @discounts = @merchant.bulk_discounts
  end

  def show
    @merchant = Merchant.find(merchant_bulk_discount_params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def new
    @merchant = Merchant.find(merchant_bulk_discount_params[:merchant_id])
  end

  def create
    discount = BulkDiscount.new(merchant_bulk_discount_params)
    if discount.save
      redirect_to merchant_bulk_discounts_path(merchant_bulk_discount_params[:merchant_id])
    else

      redirect_to new_merchant_bulk_discounts_path(merchant_bulk_discount_params[:merchant_id])
    end
  end

  private

  def merchant_bulk_discount_params
    params.permit(:percentage, :quantity_threshold, :merchant_id)
  end
end
