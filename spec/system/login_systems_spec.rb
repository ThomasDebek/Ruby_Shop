require 'rails_helper'

RSpec.describe "LoginSystems", type: :system do
  context 'when no visiting the Home Page'  do
    it 'Log In button is visible ' do
      visit "/"
      expect(page).to have_link('Log In')
    end
  end
end
