require 'rails_helper'

RSpec.describe 'merchant bulk discounts show page' do
  it 'displays bulkd discounts attributes' do
    pokemart = Merchant.create!(name: 'PokeMart')

    discount1 = pokemart.bulk_discounts.create!(percentage: 10, quantity_threshold: 10)
    discount2 = pokemart.bulk_discounts.create!(percentage: 20, quantity_threshold: 20)

    visit "/merchants/#{pokemart.id}/bulk_discounts/#{discount1.id}"

    expect(page).to have_content('Percentage: 10%')
    expect(page).to have_content('Quantity Threshold: 10')
    expect(page).to_not have_content('Percentage: 20%')
    expect(page).to_not have_content('Quantity Threshold: 20')
  end
end
