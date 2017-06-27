require 'rails_helper'

RSpec.describe "Customer pages", type: :request do
  # describe "GET /customers" do
  #   it "works! (now write some real specs)" do
  #     get customers_path
  #     expect(response).to have_http_status(200)
  #   end
  # end

  describe 'signup page', :type => :feature do
    subject { page }
    before { visit '/customers/new' }

    it { should have_content('Registration')}
    it { should have_selector(:button, 'Sign up')}
  end
end
