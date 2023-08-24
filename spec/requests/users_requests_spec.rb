require 'rails_helper'

RSpec.describe 'Users', type: :request do
  describe 'GET /index' do
    let(:user) do
      User.create(name: 'Kane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                  bio: 'Footballer from England')
    end

    it 'returns index page view as html' do
      get '/'

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'returns the correct placeholder text' do
      get '/'

      expect(response.body).to include('Users')
    end
  end

  describe 'GET /show' do
    let(:user) do
      User.create(name: 'Kane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                  bio: 'Footballer from England')
    end

    it 'returns users show page view as html' do
      get "/users/#{user.id}"

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:show)
    end

    it 'returns the correct placeholder text' do
      get "/users/#{user.id}"

      expect(response.body).to include('Number of posts')
    end
  end
end
