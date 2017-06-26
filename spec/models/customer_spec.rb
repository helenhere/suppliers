require 'rails_helper'

RSpec.describe Customer, type: :model do
  let(:city) { FactoryGirl.create(:city)}
  let(:customer) { FactoryGirl.create(:customer)}

  # it { should belong_to(:city)}

  it { should respond_to(:first_name)}
  it { should respond_to(:last_name)}
  it { should respond_to(:phone)}
  it { should respond_to(:email)}
  it { should respond_to(:password)}
  it { should respond_to(:password_confirmation)}
  it { should respond_to(:city)}
  it { should respond_to(:city_id)}
  it { should respond_to(:role)}

  it { should respond_to(:remember_token)}
  it { should respond_to(:authenticate)}

  it 'is valid' do
    expect(customer).to be_valid
  end

  it 'validates first_name' do
    expect(customer).to be_valid(:first_name)
  end

  describe 'when first_name is not present' do
    before { customer.first_name = ' '}
    it { should_not be_valid}
  end

  it 'validates last_name' do
    expect(customer).to be_valid(:last_name)
  end

  describe 'when last_name is not present' do
    before { customer.last_name = ' '}
    it { should_not be_valid}
  end

  describe 'when phone is not present' do
    before { customer.phone = ' ' }
    it { should_not be_valid }
  end

  # describe 'when phone is too short' do
  #   before { customer.phone = 'a' * 9 }
  #   it { should be_invalid }
  # end

  describe 'when phone format is valid' do
    it 'should be valid' do
      customer.phone = '0931276183'
      if customer.phone == /0[569][035-9](\d){7}/
        expect(customer).to be_valid
      end
    end

    it 'should be invalid' do
      customer.phone = 'imvalid_number'
      expect(customer).to_not be_valid
    end
  end

  describe 'when phone is already taken' do
    before do
      customer_with_same_phone = customer.dup
      customer_with_same_phone.phone = customer.phone
      customer_with_same_phone.save
    end

    it { should_not be_valid }
  end

  describe 'when role is not present' do
    before { customer.role = ' ' }
    it { should_not be_valid }
  end

  describe 'when role format is valid' do
    it 'should be valid' do
      roles = ['guest', 'customer']
      roles.each do |valid_role|
        customer.role = valid_role
        expect(customer).to be_valid
      end
    end

    it 'should be invalid' do
      customer.role = 'invalid_role'
      expect(customer).to_not be_valid
    end
  end

  describe 'remember token' do
    before { customer.save }
    it(:remember_token) { should_not be_blank }
  end

  describe 'when email is not present' do
    before { customer.email = ' ' }
    it { should_not be_valid }
  end

  describe 'when email format is invalid' do
    it 'should be invalid' do
      addresses = %w[user@foo,com user_at_foo.org example.user@foo.
                     foo@bar_baz.com foo@bar+baz.com]
      addresses.each do |invalid_address|
        customer.email = invalid_address
        expect(customer).not_to be_valid
      end
    end
  end

  describe 'when email format is valid' do
    it 'should be valid' do
      addresses = %w[user@foo.COM A_US-ER@f.b.org frst.lst@foo.jp a+b@baz.cn]
      addresses.each do |valid_address|
        customer.email = valid_address
        expect(customer).to be_valid
      end
    end
  end

  describe 'when password is not present' do
    before { customer.password = customer.password_confirmation = ' ' }
    it { should_not be_valid }
  end

  describe 'with a password that is too short' do
    before { customer.password = customer.password_confirmation = 'a' * 5 }
    it { should be_invalid }
  end

  describe 'when password does not match confirmation' do
    before { customer.password_confirmation = 'mismatch' }
    it { should_not be_valid }
  end

  describe 'return value of authenticate method' do
    before { customer.save }
    let(:found_customer) { Customer.find_by(email: customer.email) }

    it 'with valid password' do
      expect(customer).to eq found_customer.authenticate(customer.password)
    end

    describe 'with invalid password' do
      let(:customer_for_invalid_password) { found_customer.authenticate('invalid') }

      it { should_not eq customer_for_invalid_password }
      specify { expect(customer_for_invalid_password).to be false }
    end
  end

  describe 'when city_id is not present' do
    before { customer.city_id = nil }
    it { should_not be_valid }
  end

  describe 'orders associations' do

    let(:customer_with_order) { create :customer_with_order}

    it 'should destroy associated orders' do
      customer.destroy
      expect(customer.orders).to be_empty
    end
  end
end
