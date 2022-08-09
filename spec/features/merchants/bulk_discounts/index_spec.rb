require 'rails_helper'

RSpec.describe 'merchant bulk discounts index' do
  it 'links from merchant dashboard' do
    pokemart = Merchant.create!(name: 'PokeMart')

    visit "/merchants/#{pokemart.id}"

    click_link 'My Discounts'

    expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts")
  end
end
