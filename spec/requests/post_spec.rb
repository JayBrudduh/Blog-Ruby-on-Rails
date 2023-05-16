require 'rails_helper'

RSpec.describe 'Post', type: :request do
  describe 'GET /posts' do
    it 'return http success' do
      get '/users/1/posts'
      expect(response).to have_http_status(200)
    end

    it 'render correct posts template' do
      get '/users/1/posts'
      expect(response).to render_template 'index'
    end

    it 'render correct posts/show template' do
      get '/users/1/posts/show'
      expect(response).to render_template 'show'
    end
  end
end

RSpec.describe 'Response body includes correct placeholder text:', type: :feature do
  scenario 'should content User Post Home text' do
    visit '/users/1/posts'
    expect(page).to have_content('User Post Home')
  end
end
