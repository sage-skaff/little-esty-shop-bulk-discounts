require 'rails_helper'

RSpec.describe InvoiceItem do
  describe 'relationships' do
    it { should belong_to :invoice }
    it { should belong_to :item }
  end
  describe 'instance methods' do
    it 'returns total_revenue' do
      merchant1 = Merchant.create!(name: 'Snake Shop')

      customer = Customer.create!(first_name: 'Alep', last_name: 'Bloyd')

      item1_merchant1 = Item.create!(name: 'Snake Pants', description: 'It is just a sock.', unit_price: 400,
                                     merchant_id: merchant1.id)

      invoice1 = Invoice.create!(customer_id: customer.id, status: 2)

      invoiceitem1_item1_invoice1 = InvoiceItem.create!(item_id: item1_merchant1.id, invoice_id: invoice1.id,
                                                        quantity: 70, unit_price: 50, status: 0)

      expect(invoiceitem1_item1_invoice1.total_revenue).to eq(3500)
    end

    it 'returns discounted_revenue' do
      merchant1 = Merchant.create!(name: 'Snake Shop')

      customer = Customer.create!(first_name: 'Alep', last_name: 'Bloyd')

      item1_merchant1 = Item.create!(name: 'Snake Pants', description: 'It is just a sock.', unit_price: 400,
                                     merchant_id: merchant1.id)

      invoice1 = Invoice.create!(customer_id: customer.id, status: 2)

      invoiceitem1_item1_invoice1 = InvoiceItem.create!(item_id: item1_merchant1.id, invoice_id: invoice1.id,
                                                        quantity: 70, unit_price: 50, status: 0)

      discount = merchant1.bulk_discounts.create!(percentage: 10, quantity_threshold: 10)

      expect(invoiceitem1_item1_invoice1.discounted_revenue).to eq(3150)
    end

    it 'returns top_discount' do
      merchant1 = Merchant.create!(name: 'Snake Shop')

      customer = Customer.create!(first_name: 'Alep', last_name: 'Bloyd')

      item1_merchant1 = Item.create!(name: 'Snake Pants', description: 'It is just a sock.', unit_price: 400,
                                     merchant_id: merchant1.id)

      invoice1 = Invoice.create!(customer_id: customer.id, status: 2)

      invoiceitem1_item1_invoice1 = InvoiceItem.create!(item_id: item1_merchant1.id, invoice_id: invoice1.id,
                                                        quantity: 70, unit_price: 50, status: 0)

      discount = merchant1.bulk_discounts.create!(percentage: 10, quantity_threshold: 10)

      expect(invoiceitem1_item1_invoice1.top_discount).to eq(discount)
    end
  end
end
