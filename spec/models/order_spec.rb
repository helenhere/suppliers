require 'rails_helper'

RSpec.describe Order, type: :model do
  let(:city) { FactoryGirl.create(:city)}
  let(:customer) { FactoryGirl.create(:customer)}
  let(:supplier) { FactoryGirl.create(:supplier)}

  it { should respond_to(:city)}
  it { should respond_to(:city_id)}
  it { should respond_to(:customer)}
  it { should respond_to(:customer_id)}
  it { should respond_to(:supplier)}
  it { should respond_to(:supplier_id)}
end
