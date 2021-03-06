# frozen_string_literal: true

require 'rails_helper'

RSpec.describe 'Viewing Order', type: :system do
  let!(:administrator) { create(:administrator) }
  let!(:order) { create(:order) }

  context 'when logged in as administrator' do
    before do
      login_as(administrator, scope: :administrator)
      visit '/administrator'
      click_link 'Orders'
      click_link 'view'
    end

    it 'displays Order\'s details' do
      expect(page).to have_css('.order-id', text: order.id)
                        .and have_css('.order-state', text: order.state)
                               .and have_css('.order-user', text: order.user.email)
                                      .and have_css('.order-item-name', text: order.order_items.first.product.name)
                                             .and have_css('.order-total', text: order.total)
    end
  end
end