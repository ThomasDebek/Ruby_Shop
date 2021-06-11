require 'rails_helper'

RSpec.describe 'Login Systems', type: :system do

  context 'when no visiting the Home Page'  do
    it 'Log In button is visible ' do
      visit '/'
      expect(page).to have_link('Log In')
    end
  end

  context 'when visiting the Sign Up Page'  do
    it 'Log in button is visible' do
      visit '/'
      click_on 'Sign Up'
      expect(page).to have_link 'Log In'
    end
  end
end
