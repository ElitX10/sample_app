require 'rails_helper'

RSpec.describe "LayoutLinks", type: :request do

  describe "LayoutLinks" do

    it "devrait trouver une page Accueil à '/'" do
      get '/'
      expect(response.body).to have_selector("title", :text => "Accueil", visible: false)
    end

    it "devrait trouver une page Contact at '/contact'" do
      get '/contact'
      expect(response.body).to have_selector("title", :text => "Contact", visible: false)
    end

    it "devrait trouver une page À Propos à '/about'" do
      get '/about'
      expect(response.body).to have_selector("title", :text => "À Propos", visible: false)
    end

    it "devrait trouver une page Aide à '/help'" do
      get '/help'
      expect(response.body).to have_selector("title", :text => "Aide", visible: false)
    end

  end
end
