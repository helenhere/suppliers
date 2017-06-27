require 'rails_helper'

RSpec.describe CitiesController, type: :controller do

  # This should return the minimal set of attributes required to create a valid
  # City. As you add validations to City, be sure to
  # adjust the attributes here as well.
  let(:valid_attributes) {
    skip("Add a hash of attributes valid for your model")
  }

  let(:invalid_attributes) {
    skip("Add a hash of attributes invalid for your model")
  }

  # This should return the minimal set of values that should be in the session
  # in order to pass any filters (e.g. authentication) defined in
  # CitiesController. Be sure to keep this updated too.
  let(:valid_session) { {} }

  describe "GET #index" do
    it "returns a success response" do
      city = City.create! valid_attributes
      get :index, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #show" do
    it "returns a success response" do
      city = City.create! valid_attributes
      get :show, {:id => city.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #new" do
    it "returns a success response" do
      get :new, {}, valid_session
      expect(response).to be_success
    end
  end

  describe "GET #edit" do
    it "returns a success response" do
      city = City.create! valid_attributes
      get :edit, {:id => city.to_param}, valid_session
      expect(response).to be_success
    end
  end

  describe "POST #create" do
    context "with valid params" do
      it "creates a new City" do
        expect {
          post :create, {:city => valid_attributes}, valid_session
        }.to change(City, :count).by(1)
      end

      it "redirects to the created city" do
        post :create, {:city => valid_attributes}, valid_session
        expect(response).to redirect_to(City.last)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'new' template)" do
        post :create, {:city => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "PUT #update" do
    context "with valid params" do
      let(:new_attributes) {
        skip("Add a hash of attributes valid for your model")
      }

      it "updates the requested city" do
        city = City.create! valid_attributes
        put :update, {:id => city.to_param, :city => new_attributes}, valid_session
        city.reload
        skip("Add assertions for updated state")
      end

      it "redirects to the city" do
        city = City.create! valid_attributes
        put :update, {:id => city.to_param, :city => valid_attributes}, valid_session
        expect(response).to redirect_to(city)
      end
    end

    context "with invalid params" do
      it "returns a success response (i.e. to display the 'edit' template)" do
        city = City.create! valid_attributes
        put :update, {:id => city.to_param, :city => invalid_attributes}, valid_session
        expect(response).to be_success
      end
    end
  end

  describe "DELETE #destroy" do
    it "destroys the requested city" do
      city = City.create! valid_attributes
      expect {
        delete :destroy, {:id => city.to_param}, valid_session
      }.to change(City, :count).by(-1)
    end

    it "redirects to the cities list" do
      city = City.create! valid_attributes
      delete :destroy, {:id => city.to_param}, valid_session
      expect(response).to redirect_to(cities_url)
    end
  end

end
