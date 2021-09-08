FactoryBot.define do
  factory :order do
    state { :new }
    user

    after(:create) do |order|
      create(:payment, order: order)
    end
  end
end
