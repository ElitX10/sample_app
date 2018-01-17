require 'rails_helper'

RSpec.describe UsersController, type: :controller do

  before(:each) do
    @base_title = "Simple App du Tutoriel Ruby on Rails"
  end

  describe "GET #new" do
    it "returns http success" do
      get :new
      expect(response).to have_http_status(:success)
    end

    it "should have the good title" do
      get :home
      expect(response.body).to have_selector("title", :text => @base_title + " | Inscription", visible: false)
    end

  end

end
