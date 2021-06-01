require 'rails_helper'

RSpec.describe Brand, type: :model do
  it 'is valid Factories' do
    brand = FactoryBot.build(:brand)
    expect(brand).to be_valid
  end

  it 'is invalid without name a brand' do
    brand = FactoryBot.build(:brand, name:nil )
    brand.valid?
    expect(brand.errors[:name]).to include("can't be blank")
  end

end
