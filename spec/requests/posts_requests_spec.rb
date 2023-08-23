require 'rails_helper'

RSpec.describe 'Posts', type: :request do
  describe 'GET /index' do
    let(:user) do
      User.create(name: 'Kane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                  bio: 'Footballer from England')
    end

    it 'returns /users/:user_id/posts page view as html' do
      get "/users/#{user.id}/posts"

      expect(response).to have_http_status(:success)
      expect(response).to render_template(:index)
    end

    it 'returns the correct placeholder text' do
      get "/users/#{user.id}/posts"

      expect(response.body).to include('Number of posts')
    end
  end

  describe 'GET /show' do
    let(:user) do
      User.create(name: 'Kane', photo: 'https://unsplash.com/photos/F_-0BxGuVvo',
                  bio: 'Footballer from England')
    end
    let(:post) { Post.create(author: user, title: 'Hello', text: 'This is my first post') }

    it 'returns a http 200 sucesss' do
      get "/users/#{user.id}/posts/#{post.id}"

      expect(response).to have_http_status(:success)
    end

    it 'returns /users/:user_id/posts/:post_id page view as html' do
      get "/users/#{user.id}/posts/#{post.id}"

      expect(response).to render_template(:show)
    end

    it 'returns the correct placeholder text' do
      get "/users/#{user.id}/posts/#{post.id}"

      expect(response.body).to include('Hello by Kane')
    end
  end
end
