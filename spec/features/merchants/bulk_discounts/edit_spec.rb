require 'rails_helper'

RSpec.describe 'merchant bulk discounts edit' do
  it 'links from show page' do
    pokemart = Merchant.create!(name: 'PokeMart')

    discount1 = pokemart.bulk_discounts.create!(percentage: 10, quantity_threshold: 10)

    visit "/merchants/#{pokemart.id}/bulk_discounts/#{discount1.id}"

    click_link 'Edit This Discount'

    expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts/#{discount1.id}/edit")
  end

  it 'has form to edit bulk discount' do
    pokemart = Merchant.create!(name: 'PokeMart')

    discount1 = pokemart.bulk_discounts.create!(percentage: 10, quantity_threshold: 10)

    visit "/merchants/#{pokemart.id}/bulk_discounts/#{discount1.id}"

    expect(page).to have_content('Percentage: 10%')
    expect(page).to have_content('Quantity Threshold: 10')
    expect(page).to_not have_content('Percentage: 20%')
    expect(page).to_not have_content('Quantity Threshold: 20')

    click_link 'Edit This Discount'

    fill_in 'Percentage', with: 20
    fill_in 'Quantity Threshold', with: 20
    click_on 'Submit'

    expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts/#{discount1.id}")
    expect(page).to have_content('Percentage: 20%')
    expect(page).to have_content('Quantity Threshold: 20')
    expect(page).to_not have_content('Percentage: 10%')
    expect(page).to_not have_content('Quantity Threshold: 10')
  end
end
