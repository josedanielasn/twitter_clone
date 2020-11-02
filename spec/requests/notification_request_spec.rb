require 'rails_helper'

RSpec.describe "Notifications", type: :request do

  describe "GET /index" do
    it "returns http success" do
      get "/notification/index"
      expect(response).to have_http_status(:success)
    end
  end

  describe "GET /read" do
    it "returns http success" do
      get "/notification/read"
      expect(response).to have_http_status(:success)
    end
  end

end
