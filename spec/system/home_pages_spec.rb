# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'HomePages', type: :system do
  before do
    driven_by(:rack_test)
    Product.create(name: 'Tomasz', price: 2)
  end

  scenario 'views all prodcuts' do
    visit root_path
    expect(page).to have_text('Tomasz')
    expect(page).to have_text('2')
    expect(page).to have_selector 'h4.card-title'
  end
end
