require 'rails_helper'

RSpec.describe 'merchant bulk discounts index' do
  it 'links from merchant dashboard' do
    pokemart = Merchant.create!(name: 'PokeMart')

    visit "/merchants/#{pokemart.id}"

    click_link 'My Discounts'

    expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts")
  end

  it 'lists bulk discounts and their attributes' do
    pokemart = Merchant.create!(name: 'PokeMart')

    discount1 = pokemart.bulk_discounts.create!(percentage: 10, quantity_threshold: 10)
    discount2 = pokemart.bulk_discounts.create!(percentage: 20, quantity_threshold: 20)

    visit "/merchants/#{pokemart.id}/bulk_discounts"

    within "#discount-#{discount1.id}" do
      expect(page).to have_content('Percentage: 10%')
      expect(page).to_not have_content('Percentage: 20%')
      expect(page).to have_content('Quantity Threshold: 10')
      expect(page).to_not have_content('Quantity Threshold: 20')
    end

    within "#discount-#{discount2.id}" do
      expect(page).to have_content('Percentage: 20%')
      expect(page).to_not have_content('Percentage: 10%')
      expect(page).to have_content('Quantity Threshold: 20')
      expect(page).to_not have_content('Quantity Threshold: 10')
    end
  end

  it 'bulk discounts link to their show pages' do
    pokemart = Merchant.create!(name: 'PokeMart')

    discount1 = pokemart.bulk_discounts.create!(percentage: 10, quantity_threshold: 10)
    discount2 = pokemart.bulk_discounts.create!(percentage: 20, quantity_threshold: 20)

    visit "/merchants/#{pokemart.id}/bulk_discounts"

    within "#discount-#{discount1.id}" do
      expect(page).to have_link("Discount ##{discount1.id}")
    end

    within "#discount-#{discount2.id}" do
      expect(page).to have_link("Discount ##{discount2.id}")
      click_link "Discount ##{discount2.id}"
    end
    expect(current_path).to eq("/merchants/#{pokemart.id}/bulk_discounts/#{discount2.id}")
  end
end
