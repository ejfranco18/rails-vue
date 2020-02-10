require 'rails_helper'

RSpec.describe "Categories", type: :request do

  let(:user) { create :user, password: '123123123' }
  let(:token) { token_generator(user.id) }

  before :each do
    @env = {}
    @env['HTTP_AUTHORIZATION'] = token
  end

  describe "GET /api/categories" do
    it "GET list of categories" do
      get categories_path, headers: @env
      expect(response).to have_http_status(200)
    end
  end

  describe "GET /api/categories/:id" do
    let(:category) { create :category }

    it "GET a category" do
      get categories_path(category.id), headers: @env
      expect(response).to have_http_status(200)
    end

#New test to validate attributes on response
    it "GET name of a category" do
      get categories_path(category.id), headers: @env
      res = JSON.parse(response.body).first
      expect(res["name"]).to eq("category2")
    end

  end
end
