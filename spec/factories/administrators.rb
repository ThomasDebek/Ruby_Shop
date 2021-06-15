FactoryBot.define do
  factory :administrator do
    sequence(:email) { |n| "administrator_no_#{n}@example.com" }
    password { 'password' }
  end
end
