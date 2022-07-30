require 'rails_helper'

RSpec.describe 'Admin Dashboard page' do
  it 'has a header showing Admin Dashboard' do
    visit admin_index_path

    within('#admin-header') do
      expect(page).to have_content("Admin Dashboard")
    end
  end
  it 'has a link to /admin/merchants' do
    visit admin_index_path

    within('#admin-links') do
      expect(page).to have_link('Merchants')
    end
  end
  it 'has a link to /admin/invoicess' do
    visit admin_index_path

    within('#admin-links') do
      expect(page).to have_link('Invoices')
    end
  end
  it 'shows the top 5 customers(largest # of successful transactions, and the total # of transactions per customer' do
    # wizmart = Merchant.create!(name: 'Wally Wands')
    # wand1 = wizmart.items.create!(name: 'Phoenix Feather Wand', description: 'Rare and powerful', unit_price: 200)
    # wand2 = wizmart.items.create!(name: 'Unicorn Horn Wand', description: 'No unicorns were harmed', unit_price: 500)
    # wand3 = wizmart.items.create!(name: 'Manticore Claw Wand', description: 'For the bravest wizards', unit_price: 800)

    # Customer1 has 6 successful transactions
    customer1 = Customer.create!(first_name: 'Harry', last_name: 'Potter')
    c1_invoice1 = customer1.invoices.create!(status: 2)
    # invoice_item1 = InvoiceItem.create!(invoice: c1_invoice1, item: wand1, quantity: 6, unit_price: 8, status: 0)
    c1_invoice1.transactions.create!(credit_card_number: 3395123433951234, result: 1)

    c1_invoice2 = customer1.invoices.create!(status: 2)
    c1_invoice2.transactions.create!(credit_card_number: 3395123433951234, result: 1)
    c1_invoice3 = customer1.invoices.create!(status: 2)
    c1_invoice3.transactions.create!(credit_card_number: 3395123433951234, result: 1)
    c1_invoice4 = customer1.invoices.create!(status: 2)
    c1_invoice4.transactions.create!(credit_card_number: 3395123433951234, result: 1)
    c1_invoice5 = customer1.invoices.create!(status: 2)
    c1_invoice5.transactions.create!(credit_card_number: 3395123433951234, result: 1)
    c1_invoice6 = customer1.invoices.create!(status: 2)
    c1_invoice6.transactions.create!(credit_card_number: 3395123433951234, result: 1)
    
    # Customer 2 has 5 successful and 1 unsuccessful transaction
    customer2 = Customer.create!(first_name: 'Ron', last_name: 'Weasley')
    c2_invoice1 = customer2.invoices.create!(status: 2)
    # invoice_item2 = InvoiceItem.create!(invoice: c2_invoice1, item: wand2, quantity: 5, unit_price: 2, status: 0)
    c2_invoice1.transactions.create!(credit_card_number: 6695123466951234, result: 1)
    
    c2_invoice2 = customer2.invoices.create!(status: 2)
    c2_invoice2.transactions.create!(credit_card_number: 6695123466951234, result: 1)
    c2_invoice3 = customer2.invoices.create!(status: 2)
    c2_invoice3.transactions.create!(credit_card_number: 6695123466951234, result: 1)
    c2_invoice4 = customer2.invoices.create!(status: 2)
    c2_invoice4.transactions.create!(credit_card_number: 6695123466951234, result: 1)
    c2_invoice5 = customer2.invoices.create!(status: 2)
    c2_invoice5.transactions.create!(credit_card_number: 6695123466951234, result: 1)
    c2_invoice6 = customer2.invoices.create!(status: 2)
    c2_invoice6.transactions.create!(credit_card_number: 6695123466951234, result: 0)
    
    # Customer 3 has 4 successful and 3 unsuccessful transactions
    customer3 = Customer.create!(first_name: 'Hermione', last_name: 'Granger')
    c3_invoice1 = customer3.invoices.create!(status: 2)
    # invoice_item3 = InvoiceItem.create!(invoice: c3_invoice1, item: wand3, quantity: 2, unit_price: 8, status: 0)
    c3_invoice1.transactions.create!(credit_card_number: 9995123499951234, result: 1)
    c3_invoice2 = customer3.invoices.create!(status: 2)
    c3_invoice2.transactions.create!(credit_card_number: 9995123499951234, result: 1)
    c3_invoice3 = customer3.invoices.create!(status: 2)
    c3_invoice3.transactions.create!(credit_card_number: 9995123499951234, result: 1)
    c3_invoice4 = customer3.invoices.create!(status: 2)
    c3_invoice4.transactions.create!(credit_card_number: 9995123499951234, result: 1)
    c3_invoice5 = customer3.invoices.create!(status: 2)
    c3_invoice5.transactions.create!(credit_card_number: 9995123499951234, result: 0)
    c3_invoice6 = customer3.invoices.create!(status: 2)
    c3_invoice6.transactions.create!(credit_card_number: 9995123499951234, result: 0)
    c3_invoice7 = customer3.invoices.create!(status: 2)
    c3_invoice7.transactions.create!(credit_card_number: 9995123499951234, result: 0)

    # Customer 4 has 3 successful transactions
    customer4 = Customer.create!(first_name: 'Albus', last_name: 'Dumbledor')
    c4_invoice1 = customer4.invoices.create!(status: 2)
    # invoice_item4 = InvoiceItem.create!(invoice: invoice4, item: super_potion, quantity: 2, unit_price: 5, status: 0)
    c4_invoice1.transactions.create!(credit_card_number: 7795123477951234, result: 1)
    c4_invoice2 = customer4.invoices.create!(status: 2)
    c4_invoice2.transactions.create!(credit_card_number: 7795123477951234, result: 1)
    c4_invoice3 = customer4.invoices.create!(status: 2)
    c4_invoice3.transactions.create!(credit_card_number: 7795123477951234, result: 1)

    # Customer 5 has 2 successful transactions
    customer5 = Customer.create!(first_name: 'Luna', last_name: 'Lovegood')
    c5_invoice1 = customer5.invoices.create!(status: 2)
    # invoice_item4 = InvoiceItem.create!(invoice: invoice4, item: super_potion, quantity: 2, unit_price: 5, status: 0)
    c5_invoice1.transactions.create!(credit_card_number: 7795123477951234, result: 1)
    c5_invoice2 = customer5.invoices.create!(status: 2)
    c5_invoice2.transactions.create!(credit_card_number: 7795123477951234, result: 1)
    

    # Customer 6 has 1 successful transactions
    customer6 = Customer.create!(first_name: 'Sirius', last_name: 'Black')
    c6_invoice1 = customer6.invoices.create!(status: 2)
    # invoice_item4 = InvoiceItem.create!(invoice: invoice4, item: super_potion, quantity: 2, unit_price: 5, status: 0)
    c6_invoice1.transactions.create!(credit_card_number: 7795123477951234, result: 1)
    
    visit admin_index_path
save_and_open_page
    within "#customer-1" do
      expect(page).to have_content(customer1.first_name)
      expect(page).to have_content(customer1.last_name)
      expect(page).to have_content("Successful Transactions: 6")
      expect(page).to_not have_content(customer2.first_name)
      expect(page).to_not have_content(customer6.first_name)
    end

    within "#customer-2" do
      expect(page).to have_content(customer2.first_name)
      expect(page).to have_content(customer2.last_name)
      expect(page).to have_content("Successful Transactions: 5")
      expect(page).to_not have_content(customer3.first_name)
      expect(page).to_not have_content(customer6.first_name) 
    end

    within "#customer-3" do
      expect(page).to have_content(customer3.first_name)
      expect(page).to have_content(customer3.last_name)
      expect(page).to have_content("Successful Transactions: 4")
      expect(page).to_not have_content(customer4.first_name)
      expect(page).to_not have_content(customer6.first_name)
    end

    within "#customer-4" do
      expect(page).to have_content(customer4.first_name)
      expect(page).to have_content(customer4.last_name)
      expect(page).to have_content("Successful Transactions: 3")
      expect(page).to_not have_content(customer5.first_name)
      expect(page).to_not have_content(customer6.first_name)
    end

    within "#customer-5" do
      expect(page).to have_content(customer5.first_name)
      expect(page).to have_content(customer5.last_name)
      expect(page).to have_content("Successful Transactions: 2")
      expect(page).to_not have_content(customer1.first_name)
      expect(page).to_not have_content(customer6.first_name)
    end
  end
end