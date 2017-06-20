require 'rails_helper'

RSpec.describe "suppliers/new", type: :view do
  before(:each) do
    assign(:supplier, Supplier.new(
      :first_name => "MyString",
      :last_name => "MyString",
      :product_name => "MyString",
      :phone => "MyString",
      :compony => "MyString"
    ))
  end

  it "renders new supplier form" do
    render

    assert_select "form[action=?][method=?]", suppliers_path, "post" do

      assert_select "input#supplier_first_name[name=?]", "supplier[first_name]"

      assert_select "input#supplier_last_name[name=?]", "supplier[last_name]"

      assert_select "input#supplier_product_name[name=?]", "supplier[product_name]"

      assert_select "input#supplier_phone[name=?]", "supplier[phone]"

      assert_select "input#supplier_compony[name=?]", "supplier[compony]"
    end
  end
end
