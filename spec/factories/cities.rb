FactoryGirl.define do
  factory :city do
    name 'Kyiv'

    factory :city_with_order do
      after_create do |city|
        create(:order, city: city)
      end
    end

    factory :city_with_customer do
      after_create do |city|
        create(:customer, city: city)
      end
    end

    factory :city_with_supplier do
      after_create do |city|
        create(:supplier, city: city)
      end
    end
  end
end
