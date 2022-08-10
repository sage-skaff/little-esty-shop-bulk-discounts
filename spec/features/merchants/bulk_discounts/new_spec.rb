require 'rails_helper'

RSpec.describe 'merchant bulk discounts new' do
  it 'links from merchants bulk discounts index' do
    pokemart = Merchant.create!(name: 'PokeMart')

    visit "/merchants/#{pokemart.id}/bulk_discounts"

    click_link 'Create a New Discount'

    expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts/new")
  end
end
