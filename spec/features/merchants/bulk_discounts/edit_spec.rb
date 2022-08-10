require 'rails_helper'

RSpec.describe 'merchant bulk discounts edit' do
  it 'links from show page' do
    pokemart = Merchant.create!(name: 'PokeMart')

    discount1 = pokemart.bulk_discounts.create!(percentage: 10, quantity_threshold: 10)
    discount2 = pokemart.bulk_discounts.create!(percentage: 20, quantity_threshold: 20)

    visit "/merchants/#{pokemart.id}/bulk_discounts/#{discount1.id}"

    click_link 'Edit This Discount'

    expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts/#{discount1.id}/edit")
  end
end
