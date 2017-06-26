FactoryGirl.define do
  factory :supplier do
      first_name 'Name'
      last_name 'Surname'
      product_name 'Good'
      phone '0931276184'
      company 'Comp'
      city_id 1

      association :city

      factory :supplier_with_order do
        after_create do |supplier|
          create(:order, supplier: supplier)
        end
      end
  end
end
