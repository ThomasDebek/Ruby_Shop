# frozen_string_literal: true

FactoryBot.define do
  factory :product do
    name { 'Tomasz' }
    price { '9.99' }
    association :category
    association :brand
  end
end
