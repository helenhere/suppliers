require 'rails_helper'

RSpec.describe "suppliers/show", type: :view do
  before(:each) do
    @supplier = assign(:supplier, Supplier.create!(
      :first_name => "First Name",
      :last_name => "Last Name",
      :product_name => "Product Name",
      :phone => "Phone",
      :compony => "Compony"
    ))
  end

  it "renders attributes in <p>" do
    render
    expect(rendered).to match(/First Name/)
    expect(rendered).to match(/Last Name/)
    expect(rendered).to match(/Product Name/)
    expect(rendered).to match(/Phone/)
    expect(rendered).to match(/Compony/)
  end
end
