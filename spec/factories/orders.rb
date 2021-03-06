FactoryBot.define do
  factory :order do
    state { :new }
    user

    after(:create) do |order|
      create(:payment, order: order)
      create(:order_item, order: order)
    end
  end
end
