require 'rails_helper'

RSpec.describe VisitorsController, type: :controller do

  describe "GET #index" do
    it "returns http success" do
      get :index
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET #fancy_faq_demo" do
    it "returns http success" do
      get :fancy_faq_demo
      expect(response).to have_http_status(:success)
    end
  end

end
