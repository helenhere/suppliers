# require '.../factories/cities'

FactoryGirl.define do
  factory :customer do
    first_name 'Olena'
    last_name 'Yeremenko'
    phone '0931276183'
    email 'helen8here@gmail.com'
    password 'password'
    city_id 1
    role 'guest'

    association :city

    factory :customer_with_order do
      after_create do |customer|
        create(:order, customer: customer)
      end
    end
  end
end
