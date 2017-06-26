require 'rails_helper'

RSpec.describe "suppliers/index", type: :view do
  before(:each) do
    assign(:suppliers, [
      Supplier.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :product_name => "Product Name",
        :phone => "0931276184",
        :company => "Company",
        :city_id => 1
      ),
      Supplier.create!(
        :first_name => "First Name",
        :last_name => "Last Name",
        :product_name => "Product Name",
        :phone => "0931276184",
        :company => "Company",
        :city_id => 1
      )
    ])
  end

  it "renders a list of suppliers" do
    render
    assert_select "tr>td", :text => "First Name".to_s, :count => 2
    assert_select "tr>td", :text => "Last Name".to_s, :count => 2
    assert_select "tr>td", :text => "Product Name".to_s, :count => 2
    assert_select "tr>td", :text => "Phone".to_s, :count => 2
    assert_select "tr>td", :text => "Company".to_s, :count => 2
  end
end
