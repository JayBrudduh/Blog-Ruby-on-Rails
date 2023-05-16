require 'rails_helper'

RSpec.describe "Users", type: :request do
  describe "GET /users" do

    it "return http success" do
      get "/users"
      expect(response).to have_http_status(200)
    end

    it "render correct users template" do
      get '/users'
      expect(response).to render_template 'index'
    end

    it "render correct users/show template" do
      get '/users/show'
      expect(response).to render_template 'show'
    end

  end
end

RSpec.describe "Response body includes correct placeholder text:", type: :feature do

  scenario "should content Blog Home text" do
    visit '/users'
    expect(page).to have_content("Blog Home")
  end

end
