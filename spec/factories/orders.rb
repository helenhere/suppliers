FactoryGirl.define do
  factory :order do
    city_id 1
    customer_id 1
    supplier_id 1

    association :city
    association :customer
    association :supplier
  end
end
