require 'rails_helper'

RSpec.describe Supplier, type: :model do
  let(:city) { FactoryGirl.create(:city)}
  let(:supplier) { FactoryGirl.create(:supplier)}

  # it { should belong_to(:city)}

  it { should respond_to(:first_name)}
  it { should respond_to(:last_name)}
  it { should respond_to(:product_name)}
  it { should respond_to(:phone)}
  it { should respond_to(:company)}
  it { should respond_to(:city)}
  it { should respond_to(:city_id)}

  it 'is valid' do
    expect(supplier).to be_valid
  end

  it 'validates first_name' do
    expect(supplier).to be_valid(:first_name)
  end

  describe 'when first_name is not present' do
    before { supplier.first_name = ' '}
    it { should_not be_valid}
  end

  it 'validates last_name' do
    expect(supplier).to be_valid(:last_name)
  end

  describe 'when last_name is not present' do
    before { supplier.last_name = ' '}
    it { should_not be_valid}
  end

  describe 'when phone is not present' do
    before { supplier.phone = ' ' }
    it { should_not be_valid }
  end

  describe 'when phone format is valid' do
    it 'should be valid' do
      supplier.phone = '0931276184'
      if supplier.phone == /0[569][035-9](\d){7}/
        expect(supplier).to be_valid
      end
    end

    it 'should be invalid' do
      supplier.phone = 'imvalid_number'
      expect(supplier).to_not be_valid
    end
  end

  describe 'when phone is already taken' do
    before do
      supplier_with_same_phone = supplier.dup
      supplier_with_same_phone.phone = supplier.phone
      supplier_with_same_phone.save
    end

    it { should_not be_valid }
  end

  it 'validates product_name' do
    expect(supplier).to be_valid(:product_name)
  end

  describe 'when product_name is not present' do
    before { supplier.product_name = ' '}
    it { should_not be_valid}
  end

  it 'validates company' do
    expect(supplier).to be_valid(:company)
  end

  describe 'when company is not present' do
    before { supplier.company = ' '}
    it { should_not be_valid}
  end

  describe 'when city_id is not present' do
    before { supplier.city_id = nil }
    it { should_not be_valid }
  end

  describe 'orders associations' do

    let(:supplier_with_order) { create :supplier_with_order}

    it 'should destroy associated orders' do
      supplier.destroy
      expect(supplier.orders).to be_empty
    end
  end
end
