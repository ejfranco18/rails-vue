require 'rails_helper'

RSpec.describe "Categories", type: :request do
  describe "GET /api/categories" do
    it "GET list of categories" do
      get categories_path
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/categories/:id" do
    let(:category) { create :category }

    it "GET a category" do
      get categories_path category.id
      expect(response).to have_http_status(200)
    end

#New test to validate attributes on response
    it "GET name of a category" do
      get categories_path category.id
      res = JSON.parse(response.body).first
      expect(res["name"]).to eq("MyString")
    end

  end
end
