FactoryBot.define do
  factory :order do
    state { :new }
    user
  end
end
