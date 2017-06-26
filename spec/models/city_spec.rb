require 'rails_helper'

RSpec.describe City, type: :model do
  let(:city) { FactoryGirl.create(:city)}

  # it { should have_many(:customers)}
  # it { should have_many(:suppliers)}
  it { should respond_to(:customers)}
  it { should respond_to(:suppliers)}

  it { should respond_to(:name)}

  it 'is valid' do
    expect(city).to be_valid
  end

  describe 'when name is not present' do
    before { city.name = ' '}
    it {should_not be_valid}
  end

  describe 'orders associations' do

    let(:city_with_order) { create :city_with_order}

    it 'should destroy associated orders' do
      city.destroy
      expect(city.orders).to be_empty
    end
  end

  describe 'customers associations' do

    let(:city_with_customer) { create :city_with_customer}

    it 'should destroy associated customers' do
      city.destroy
      expect(city.customers).to be_empty
    end
  end

  describe 'suppliers associations' do

    let(:city_with_supplier) { create :city_with_supplier}

    it 'should destroy associated suppliers' do
      city.destroy
      expect(city.suppliers).to be_empty
    end
  end
end
