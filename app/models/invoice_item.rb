class InvoiceItem < ApplicationRecord
  enum status: { packaged: 0, pending: 1, shipped: 2 }

  belongs_to :invoice
  belongs_to :item
  has_one :merchant, through: :item
  has_many :bulk_discounts, through: :merchant

  def total_revenue
    quantity * unit_price
  end

  def top_discount
    item.merchant.bulk_discounts.select('bulk_discounts.*')
        .where('bulk_discounts.quantity_threshold <= ?', quantity)
        .order('bulk_discounts.percentage DESC')
        .first
  end

  def discounted_revenue
    total_revenue - (top_discount.percentage * total_revenue.to_f / 100)
  end
end

