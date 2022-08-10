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

  def destroy
    discount = BulkDiscount.find(params[:id])
    discount.destroy
    redirect_to merchant_bulk_discounts_path(merchant_bulk_discount_params[:merchant_id])
  end

  def edit
    @merchant = Merchant.find(merchant_bulk_discount_params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
  end

  def update
    @merchant = Merchant.find(merchant_bulk_discount_params[:merchant_id])
    @discount = BulkDiscount.find(params[:id])
    @discount.update(merchant_bulk_discount_params)
    redirect_to "/merchants/#{@merchant.id}/bulk_discounts/#{@discount.id}"
  end

  private

  def merchant_bulk_discount_params
    params.permit(:percentage, :quantity_threshold, :merchant_id)
  end
end
