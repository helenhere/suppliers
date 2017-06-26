require 'rails_helper'

RSpec.describe "suppliers/edit", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      :first_name => "MyString",
      :last_name => "MyString",
      :product_name => "MyString",
      :phone => "0931276184",
      :company => "MyString",
      :city_id => 1
    ))
  end

  it "renders the edit supplier form" do
    render

    assert_select "form[action=?][method=?]", supplier_path(@supplier), "post" do

      assert_select "input#supplier_first_name[name=?]", "supplier[first_name]"

      assert_select "input#supplier_last_name[name=?]", "supplier[last_name]"

      assert_select "input#supplier_product_name[name=?]", "supplier[product_name]"

      assert_select "input#supplier_phone[name=?]", "supplier[phone]"

      assert_select "input#supplier_company[name=?]", "supplier[company]"
    end
  end
end
