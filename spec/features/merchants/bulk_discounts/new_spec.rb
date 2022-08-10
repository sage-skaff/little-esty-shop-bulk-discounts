require 'rails_helper'

RSpec.describe 'merchant bulk discounts new' do
  it 'links from merchants bulk discounts index' do
    pokemart = Merchant.create!(name: 'PokeMart')

    visit "/merchants/#{pokemart.id}/bulk_discounts"

    click_link 'Create a New Discount'

    expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts/new")
  end

  it 'has form to create new bulk discount' do
    pokemart = Merchant.create!(name: 'PokeMart')

    visit "/merchants/#{pokemart.id}/bulk_discounts"

    expect(page).to_not have_content('Percentage: 10%')
    expect(page).to_not have_content('Quantity Threshold: 10')

    visit "/merchants/#{pokemart.id}/bulk_discounts/new"

    fill_in 'Percentage', with: 10
    fill_in 'Quantity Threshold', with: 10

    click_on 'Submit'

    expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts")
    expect(page).to have_content('Percentage: 10%')
    expect(page).to have_content('Quantity Threshold: 10')
  end
end
