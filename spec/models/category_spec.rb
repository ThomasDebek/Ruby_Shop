# frozen_string_literal: true

require 'rails_helper'

RSpec.describe Category, type: :model do
  it 'is valid Factories' do
    category = FactoryBot.build(:category)
    expect(category).to be_valid
  end

  it 'is invalid without name a category' do
    category = FactoryBot.build(:category, name: nil)
    category.valid?
    expect(category.errors[:name]).to include("can't be blank")
  end
end
